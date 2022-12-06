import 'dart:convert';

Posts postsFromJson(String str) => Posts.fromJson(json.decode(str));

String postsToJson(Posts data) => json.encode(data.toJson());

class Posts {
  Posts({
    this.kind,
    this.data,
  });

  String? kind;
  PostsData? data;

  factory Posts.fromJson(Map<String, dynamic> json) => Posts(
    kind: json["kind"],
    data: json["data"] == null ? null : PostsData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "kind": kind,
    "data": data == null ? null : data!.toJson(),
  };
}

class PostsData {
  PostsData({
    this.after,
    this.dist,
    this.modhash,
    this.geoFilter,
    this.children,
    this.before,
  });

  String? after;
  num? dist;
  String? modhash;
  dynamic geoFilter;
  List<Child>? children;
  dynamic before;

  factory PostsData.fromJson(Map<String, dynamic> json) => PostsData(
    after: json["after"],
    dist: json["dist"],
    modhash: json["modhash"],
    geoFilter: json["geo_filter"],
    children: json["children"] == null ? null : List<Child>.from(json["children"].map((x) => Child.fromJson(x))),
    before: json["before"],
  );

  Map<String, dynamic> toJson() => {
    "after": after,
    "dist": dist,
    "modhash": modhash,
    "geo_filter": geoFilter,
    "children": children == null ? null : List<dynamic>.from(children!.map((x) => x.toJson())),
    "before": before,
  };
}

class Child {
  Child({
    this.kind,
    this.data,
  });

  String? kind;
  ChildData? data;

  factory Child.fromJson(Map<String, dynamic> json) => Child(
    kind: json["kind"],
    data: json["data"] == null ? null : ChildData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "kind": kind,
    "data": data == null ? null : data!.toJson(),
  };
}

class ChildData {
  ChildData({
    this.approvedAtUtc,
    this.subreddit,
    this.selftext,
    this.authorFullname,
    this.saved,
    this.modReasonTitle,
    this.gilded,
    this.clicked,
    this.title,
    this.linkFlairRichtext,
    this.subredditNamePrefixed,
    this.hidden,
    this.pwls,
    this.linkFlairCssClass,
    this.downs,
    this.thumbnailHeight,
    this.topAwardedType,
    this.hideScore,
    this.name,
    this.quarantine,
    this.linkFlairTextColor,
    this.upvoteRatio,
    this.authorFlairBackgroundColor,
    this.subredditType,
    this.ups,
    this.totalAwardsReceived,
    this.mediaEmbed,
    this.thumbnailWidth,
    this.authorFlairTemplateId,
    this.isOriginalContent,
    this.userReports,
    this.secureMedia,
    this.isRedditMediaDomain,
    this.isMeta,
    this.category,
    this.secureMediaEmbed,
    this.linkFlairText,
    this.canModPost,
    this.score,
    this.approvedBy,
    this.isCreatedFromAdsUi,
    this.authorPremium,
    this.thumbnail,
    this.edited,
    this.authorFlairCssClass,
    this.authorFlairRichtext,
    this.gildings,
    this.postHint,
    this.contentCategories,
    this.isSelf,
    this.modNote,
    this.created,
    this.linkFlairType,
    this.wls,
    this.removedByCategory,
    this.bannedBy,
    this.authorFlairType,
    this.domain,
    this.allowLiveComments,
    this.selftextHtml,
    this.likes,
    this.suggestedSort,
    this.bannedAtUtc,
    this.viewCount,
    this.archived,
    this.noFollow,
    this.isCrosspostable,
    this.pinned,
    this.over18,
    this.preview,
    this.allAwardings,
    this.awarders,
    this.mediaOnly,
    this.linkFlairTemplateId,
    this.canGild,
    this.spoiler,
    this.locked,
    this.authorFlairText,
    this.treatmentTags,
    this.visited,
    this.removedBy,
    this.numReports,
    this.distinguished,
    this.subredditId,
    this.authorIsBlocked,
    this.modReasonBy,
    this.removalReason,
    this.linkFlairBackgroundColor,
    this.id,
    this.isRobotIndexable,
    this.reportReasons,
    this.author,
    this.discussionType,
    this.numComments,
    this.sendReplies,
    this.whitelistStatus,
    this.contestMode,
    this.modReports,
    this.authorPatreonFlair,
    this.authorFlairTextColor,
    this.permalink,
    this.parentWhitelistStatus,
    this.stickied,
    this.url,
    this.subredditSubscribers,
    this.createdUtc,
    this.numCrossposts,
    this.media,
    this.isVideo,
    this.urlOverriddenByDest,
  });

  dynamic approvedAtUtc;
  String? subreddit;
  String? selftext;
  String? authorFullname;
  dynamic saved;
  dynamic modReasonTitle;
  num? gilded;
  dynamic clicked;
  String? title;
  List<FlairRichtext>? linkFlairRichtext;
  String? subredditNamePrefixed;
  dynamic hidden;
  num? pwls;
  String? linkFlairCssClass;
  num? downs;
  num? thumbnailHeight;
  dynamic topAwardedType;
  dynamic hideScore;
  String? name;
  dynamic quarantine;
  String? linkFlairTextColor;
  double? upvoteRatio;
  String? authorFlairBackgroundColor;
  String? subredditType;
  num? ups;
  num? totalAwardsReceived;
  Gildings? mediaEmbed;
  num? thumbnailWidth;
  String? authorFlairTemplateId;
  dynamic isOriginalContent;
  List<dynamic>? userReports;
  dynamic secureMedia;
  dynamic isRedditMediaDomain;
  dynamic isMeta;
  dynamic category;
  Gildings? secureMediaEmbed;
  String? linkFlairText;
  dynamic canModPost;
  num? score;
  dynamic approvedBy;
  dynamic isCreatedFromAdsUi;
  dynamic authorPremium;
  String? thumbnail;
  dynamic edited;
  dynamic authorFlairCssClass;
  List<FlairRichtext>? authorFlairRichtext;
  Gildings? gildings;
  String? postHint;
  dynamic contentCategories;
  dynamic isSelf;
  dynamic modNote;
  num? created;
  String? linkFlairType;
  num? wls;
  dynamic removedByCategory;
  dynamic bannedBy;
  String? authorFlairType;
  String? domain;
  dynamic allowLiveComments;
  String? selftextHtml;
  dynamic likes;
  String? suggestedSort;
  dynamic bannedAtUtc;
  dynamic viewCount;
  dynamic archived;
  dynamic noFollow;
  dynamic isCrosspostable;
  dynamic pinned;
  dynamic over18;
  Preview? preview;
  List<dynamic>? allAwardings;
  List<dynamic>? awarders;
  dynamic mediaOnly;
  String? linkFlairTemplateId;
  dynamic canGild;
  dynamic spoiler;
  dynamic locked;
  String? authorFlairText;
  List<dynamic>? treatmentTags;
  dynamic visited;
  dynamic removedBy;
  dynamic numReports;
  dynamic distinguished;
  String? subredditId;
  dynamic authorIsBlocked;
  dynamic modReasonBy;
  dynamic removalReason;
  String? linkFlairBackgroundColor;
  String? id;
  dynamic isRobotIndexable;
  dynamic reportReasons;
  String? author;
  dynamic discussionType;
  num? numComments;
  dynamic sendReplies;
  String? whitelistStatus;
  dynamic contestMode;
  List<dynamic>? modReports;
  dynamic authorPatreonFlair;
  String? authorFlairTextColor;
  String? permalink;
  String? parentWhitelistStatus;
  dynamic stickied;
  String? url;
  num? subredditSubscribers;
  num? createdUtc;
  num? numCrossposts;
  dynamic media;
  dynamic isVideo;
  String? urlOverriddenByDest;

  factory ChildData.fromJson(Map<String, dynamic> json) => ChildData(
    approvedAtUtc: json["approved_at_utc"],
    subreddit: json["subreddit"],
    selftext: json["selftext"],
    authorFullname: json["author_fullname"],
    saved: json["saved"],
    modReasonTitle: json["mod_reason_title"],
    gilded: json["gilded"],
    clicked: json["clicked"],
    title: json["title"],
    linkFlairRichtext: json["link_flair_richtext"] == null ? null : List<FlairRichtext>.from(json["link_flair_richtext"].map((x) => FlairRichtext.fromJson(x))),
    subredditNamePrefixed: json["subreddit_name_prefixed"],
    hidden: json["hidden"],
    pwls: json["pwls"],
    linkFlairCssClass: json["link_flair_css_class"],
    downs: json["downs"],
    thumbnailHeight: json["thumbnail_height"],
    topAwardedType: json["top_awarded_type"],
    hideScore: json["hide_score"],
    name: json["name"],
    quarantine: json["quarantine"],
    linkFlairTextColor: json["link_flair_text_color"],
    upvoteRatio: json["upvote_ratio"].toDouble(),
    authorFlairBackgroundColor: json["author_flair_background_color"],
    subredditType: json["subreddit_type"],
    ups: json["ups"],
    totalAwardsReceived: json["total_awards_received"],
    mediaEmbed: json["media_embed"] == null ? null : Gildings.fromJson(json["media_embed"]),
    thumbnailWidth: json["thumbnail_width"],
    authorFlairTemplateId: json["author_flair_template_id"],
    isOriginalContent: json["is_original_content"],
    userReports: json["user_reports"] == null ? null : List<dynamic>.from(json["user_reports"].map((x) => x)),
    secureMedia: json["secure_media"],
    isRedditMediaDomain: json["is_reddit_media_domain"],
    isMeta: json["is_meta"],
    category: json["category"],
    secureMediaEmbed: json["secure_media_embed"] == null ? null : Gildings.fromJson(json["secure_media_embed"]),
    linkFlairText: json["link_flair_text"],
    canModPost: json["can_mod_post"],
    score: json["score"],
    approvedBy: json["approved_by"],
    isCreatedFromAdsUi: json["is_created_from_ads_ui"],
    authorPremium: json["author_premium"],
    thumbnail: json["thumbnail"],
    edited: json["edited"],
    authorFlairCssClass: json["author_flair_css_class"],
    authorFlairRichtext: json["author_flair_richtext"] == null ? null : List<FlairRichtext>.from(json["author_flair_richtext"].map((x) => FlairRichtext.fromJson(x))),
    gildings: json["gildings"] == null ? null : Gildings.fromJson(json["gildings"]),
    postHint: json["post_hint"],
    contentCategories: json["content_categories"],
    isSelf: json["is_self"],
    modNote: json["mod_note"],
    created: json["created"],
    linkFlairType: json["link_flair_type"],
    wls: json["wls"],
    removedByCategory: json["removed_by_category"],
    bannedBy: json["banned_by"],
    authorFlairType: json["author_flair_type"],
    domain: json["domain"],
    allowLiveComments: json["allow_live_comments"],
    selftextHtml: json["selftext_html"],
    likes: json["likes"],
    suggestedSort: json["suggested_sort"],
    bannedAtUtc: json["banned_at_utc"],
    viewCount: json["view_count"],
    archived: json["archived"],
    noFollow: json["no_follow"],
    isCrosspostable: json["is_crosspostable"],
    pinned: json["pinned"],
    over18: json["over_18"],
    preview: json["preview"] == null ? null : Preview.fromJson(json["preview"]),
    allAwardings: json["all_awardings"] == null ? null : List<dynamic>.from(json["all_awardings"].map((x) => x)),
    awarders: json["awarders"] == null ? null : List<dynamic>.from(json["awarders"].map((x) => x)),
    mediaOnly: json["media_only"],
    linkFlairTemplateId: json["link_flair_template_id"],
    canGild: json["can_gild"],
    spoiler: json["spoiler"],
    locked: json["locked"],
    authorFlairText: json["author_flair_text"],
    treatmentTags: json["treatment_tags"] == null ? null : List<dynamic>.from(json["treatment_tags"].map((x) => x)),
    visited: json["visited"],
    removedBy: json["removed_by"],
    numReports: json["num_reports"],
    distinguished: json["distinguished"],
    subredditId: json["subreddit_id"],
    authorIsBlocked: json["author_is_blocked"],
    modReasonBy: json["mod_reason_by"],
    removalReason: json["removal_reason"],
    linkFlairBackgroundColor: json["link_flair_background_color"],
    id: json["id"],
    isRobotIndexable: json["is_robot_indexable"],
    reportReasons: json["report_reasons"],
    author: json["author"],
    discussionType: json["discussion_type"],
    numComments: json["num_comments"],
    sendReplies: json["send_replies"],
    whitelistStatus: json["whitelist_status"],
    contestMode: json["contest_mode"],
    modReports: json["mod_reports"] == null ? null : List<dynamic>.from(json["mod_reports"].map((x) => x)),
    authorPatreonFlair: json["author_patreon_flair"],
    authorFlairTextColor: json["author_flair_text_color"],
    permalink: json["permalink"],
    parentWhitelistStatus: json["parent_whitelist_status"],
    stickied: json["stickied"],
    url: json["url"],
    subredditSubscribers: json["subreddit_subscribers"],
    createdUtc: json["created_utc"],
    numCrossposts: json["num_crossposts"],
    media: json["media"],
    isVideo: json["is_video"],
    urlOverriddenByDest: json["url_overridden_by_dest"],
  );

  Map<String, dynamic> toJson() => {
    "approved_at_utc": approvedAtUtc,
    "subreddit": subreddit,
    "selftext": selftext,
    "author_fullname": authorFullname,
    "saved": saved,
    "mod_reason_title": modReasonTitle,
    "gilded": gilded,
    "clicked": clicked,
    "title": title,
    "link_flair_richtext": linkFlairRichtext == null ? null : List<dynamic>.from(linkFlairRichtext!.map((x) => x.toJson())),
    "subreddit_name_prefixed": subredditNamePrefixed,
    "hidden": hidden,
    "pwls": pwls,
    "link_flair_css_class": linkFlairCssClass,
    "downs": downs,
    "thumbnail_height": thumbnailHeight,
    "top_awarded_type": topAwardedType,
    "hide_score": hideScore,
    "name": name,
    "quarantine": quarantine,
    "link_flair_text_color": linkFlairTextColor,
    "upvote_ratio": upvoteRatio,
    "author_flair_background_color": authorFlairBackgroundColor,
    "subreddit_type": subredditType,
    "ups": ups,
    "total_awards_received": totalAwardsReceived,
    "media_embed": mediaEmbed == null ? null : mediaEmbed!.toJson(),
    "thumbnail_width": thumbnailWidth,
    "author_flair_template_id": authorFlairTemplateId,
    "is_original_content": isOriginalContent,
    "user_reports": userReports == null ? null : List<dynamic>.from(userReports!.map((x) => x)),
    "secure_media": secureMedia,
    "is_reddit_media_domain": isRedditMediaDomain,
    "is_meta": isMeta,
    "category": category,
    "secure_media_embed": secureMediaEmbed == null ? null : secureMediaEmbed!.toJson(),
    "link_flair_text": linkFlairText,
    "can_mod_post": canModPost,
    "score": score,
    "approved_by": approvedBy,
    "is_created_from_ads_ui": isCreatedFromAdsUi,
    "author_premium": authorPremium,
    "thumbnail": thumbnail,
    "edited": edited,
    "author_flair_css_class": authorFlairCssClass,
    "author_flair_richtext": authorFlairRichtext == null ? null : List<dynamic>.from(authorFlairRichtext!.map((x) => x.toJson())),
    "gildings": gildings == null ? null : gildings!.toJson(),
    "post_hint": postHint,
    "content_categories": contentCategories,
    "is_self": isSelf,
    "mod_note": modNote,
    "created": created,
    "link_flair_type": linkFlairType,
    "wls": wls,
    "removed_by_category": removedByCategory,
    "banned_by": bannedBy,
    "author_flair_type": authorFlairType,
    "domain": domain,
    "allow_live_comments": allowLiveComments,
    "selftext_html": selftextHtml,
    "likes": likes,
    "suggested_sort": suggestedSort,
    "banned_at_utc": bannedAtUtc,
    "view_count": viewCount,
    "archived": archived,
    "no_follow": noFollow,
    "is_crosspostable": isCrosspostable,
    "pinned": pinned,
    "over_18": over18,
    "preview": preview == null ? null : preview!.toJson(),
    "all_awardings": allAwardings == null ? null : List<dynamic>.from(allAwardings!.map((x) => x)),
    "awarders": awarders == null ? null : List<dynamic>.from(awarders!.map((x) => x)),
    "media_only": mediaOnly,
    "link_flair_template_id": linkFlairTemplateId,
    "can_gild": canGild,
    "spoiler": spoiler,
    "locked": locked,
    "author_flair_text": authorFlairText,
    "treatment_tags": treatmentTags == null ? null : List<dynamic>.from(treatmentTags!.map((x) => x)),
    "visited": visited,
    "removed_by": removedBy,
    "num_reports": numReports,
    "distinguished": distinguished,
    "subreddit_id": subredditId,
    "author_is_blocked": authorIsBlocked,
    "mod_reason_by": modReasonBy,
    "removal_reason": removalReason,
    "link_flair_background_color": linkFlairBackgroundColor,
    "id": id,
    "is_robot_indexable": isRobotIndexable,
    "report_reasons": reportReasons,
    "author": author,
    "discussion_type": discussionType,
    "num_comments": numComments,
    "send_replies": sendReplies,
    "whitelist_status": whitelistStatus,
    "contest_mode": contestMode,
    "mod_reports": modReports == null ? null : List<dynamic>.from(modReports!.map((x) => x)),
    "author_patreon_flair": authorPatreonFlair,
    "author_flair_text_color": authorFlairTextColor,
    "permalink": permalink,
    "parent_whitelist_status": parentWhitelistStatus,
    "stickied": stickied,
    "url": url,
    "subreddit_subscribers": subredditSubscribers,
    "created_utc": createdUtc,
    "num_crossposts": numCrossposts,
    "media": media,
    "is_video": isVideo,
    "url_overridden_by_dest": urlOverriddenByDest,
  };

}

class FlairRichtext {
  FlairRichtext({
    this.e,
    this.t,
  });

  String? e;
  String? t;

  factory FlairRichtext.fromJson(Map<String, dynamic> json) => FlairRichtext(
    e: json["e"],
    t: json["t"],
  );

  Map<String, dynamic> toJson() => {
    "e": e,
    "t": t,
  };
}

class Gildings {
  Gildings();

  factory Gildings.fromJson(Map<String, dynamic> json) => Gildings(
  );

  Map<String, dynamic> toJson() => {
  };
}

class Preview {
  Preview({
    this.images,
    this.enabled,
  });

  List<PostImage>? images;
  dynamic enabled;

  factory Preview.fromJson(Map<String, dynamic> json) => Preview(
    images: json["images"] == null ? null : List<PostImage>.from(json["images"].map((x) => PostImage.fromJson(x))),
    enabled: json["enabled"],
  );

  Map<String, dynamic> toJson() => {
    "images": images == null ? null : List<dynamic>.from(images!.map((x) => x.toJson())),
    "enabled": enabled,
  };
}

class PostImage {
  PostImage({
    this.source,
    this.resolutions,
    this.variants,
    this.id,
  });

  Source? source;
  List<Source>? resolutions;
  Gildings? variants;
  String? id;

  factory PostImage.fromJson(Map<String, dynamic> json) => PostImage(
    source: json["source"] == null ? null : Source.fromJson(json["source"]),
    resolutions: json["resolutions"] == null ? null : List<Source>.from(json["resolutions"].map((x) => Source.fromJson(x))),
    variants: json["variants"] == null ? null : Gildings.fromJson(json["variants"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "source": source == null ? null : source!.toJson(),
    "resolutions": resolutions == null ? null : List<dynamic>.from(resolutions!.map((x) => x.toJson())),
    "variants": variants == null ? null : variants!.toJson(),
    "id": id,
  };
}

class Source {
  Source({
    this.url,
    this.width,
    this.height,
  });

  String? url;
  num? width;
  num? height;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    url: json["url"],
    width: json["width"],
    height: json["height"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "width": width,
    "height": height,
  };
}
