import 'dart:convert';

Comments commentsFromJson(String str) => Comments.fromJson(json.decode(str));

String commentsToJson(Comments data) => json.encode(data.toJson());

class Comments {
  Comments({
      this.kind,
      this.data,
  });

  String? kind;
  CommentData? data;

  factory Comments.fromJson(Map<String, dynamic> json) => Comments(
      kind: json["kind"],
      data: CommentData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
      "kind": kind,
      "data":  data == null ? null : data!.toJson(),
  };
}

class CommentData {
  CommentData({
      this.after,
      this.dist,
      this.modhash,
      this.geoFilter,
      this.children,
      this.before,
  });

  dynamic after;
  int? dist;
  String? modhash;
  String? geoFilter;
  List<Child>? children;
  dynamic before;

  factory CommentData.fromJson(Map<String, dynamic> json) => CommentData(
      after: json["after"],
      dist: json["dist"],
      modhash: json["modhash"],
      geoFilter: json["geo_filter"],
      children: List<Child>.from(json["children"].map((x) => Child.fromJson(x))),
      before: json["before"],
  );

  Map<String, dynamic> toJson() => {
      "after": after,
      "dist": dist,
      "modhash": modhash,
      "geo_filter": geoFilter,
      "children": List<dynamic>.from(children!.map((x) => x.toJson())),
      "before": before,
  };
}

class Child {
  Child({
      this.kind,
      this.data,
  });

  String? kind;
  Data? data;

  factory Child.fromJson(Map<String, dynamic> json) => Child(
      kind: json["kind"],
      data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
      "kind": kind,
      "data": data == null ? null : data!.toJson(),
  };
}

class Data {
  Data({
    this.approvedAtUtc,
    this.subreddit,
    this.selftext,
    this.userReports,
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
    this.parentWhitelistStatus,
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
    this.authorFullname,
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
    this.urlOverriddenByDest,
    this.viewCount,
    this.archived,
    this.noFollow,
    this.isCrosspostable,
    this.pinned,
    this.over18,
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
    this.numDuplicates,
    this.reportReasons,
    this.author,
    this.discussionType,
    this.numComments,
    this.sendReplies,
    this.media,
    this.contestMode,
    this.authorPatreonFlair,
    this.authorFlairTextColor,
    this.permalink,
    this.whitelistStatus,
    this.stickied,
    this.url,
    this.subredditSubscribers,
    this.createdUtc,
    this.numCrossposts,
    this.modReports,
    this.isVideo,
    this.commentType,
    this.replies,
    this.collapsedReasonCode,
    this.parentId,
    this.collapsed,
    this.body,
    this.isSubmitter,
    this.bodyHtml,
    this.collapsedReason,
    this.associatedAward,
    this.unrepliableReason,
    this.scoreHidden,
    this.linkId,
    this.controversiality,
    this.depth,
    this.collapsedBecauseCrowdControl,
  });

  dynamic approvedAtUtc;
  String? subreddit;
  String? selftext;
  List<dynamic>? userReports;
  bool? saved;
  dynamic modReasonTitle;
  int? gilded;
  bool? clicked;
  String? title;
  List<LinkFlairRichtext>? linkFlairRichtext;
  String? subredditNamePrefixed;
  bool? hidden;
  int? pwls;
  String? linkFlairCssClass;
  int? downs;
  dynamic thumbnailHeight;
  dynamic topAwardedType;
  String? parentWhitelistStatus;
  bool? hideScore;
  String? name;
  bool? quarantine;
  String? linkFlairTextColor;
  double? upvoteRatio;
  dynamic authorFlairBackgroundColor;
  String? subredditType;
  int? ups;
  int? totalAwardsReceived;
  Gildings? mediaEmbed;
  dynamic thumbnailWidth;
  dynamic authorFlairTemplateId;
  bool? isOriginalContent;
  String? authorFullname;
  dynamic secureMedia;
  bool? isRedditMediaDomain;
  bool? isMeta;
  dynamic category;
  Gildings? secureMediaEmbed;
  String? linkFlairText;
  bool? canModPost;
  int? score;
  dynamic approvedBy;
  bool? isCreatedFromAdsUi;
  bool? authorPremium;
  String? thumbnail;
  bool? edited;
  dynamic authorFlairCssClass;
  List<dynamic>? authorFlairRichtext;
  Gildings? gildings;
  dynamic contentCategories;
  bool? isSelf;
  dynamic modNote;
  int? created;
  String? linkFlairType;
  int? wls;
  dynamic removedByCategory;
  dynamic bannedBy;
  String? authorFlairType;
  String? domain;
  bool? allowLiveComments;
  dynamic selftextHtml;
  dynamic likes;
  dynamic suggestedSort;
  dynamic bannedAtUtc;
  String? urlOverriddenByDest;
  dynamic viewCount;
  bool? archived;
  bool? noFollow;
  bool? isCrosspostable;
  bool? pinned;
  bool? over18;
  List<dynamic>? allAwardings;
  List<dynamic>? awarders;
  bool? mediaOnly;
  String? linkFlairTemplateId;
  bool? canGild;
  bool? spoiler;
  bool? locked;
  dynamic authorFlairText;
  List<dynamic>? treatmentTags;
  bool? visited;
  dynamic removedBy;
  dynamic numReports;
  String? distinguished;
  String? subredditId;
  bool? authorIsBlocked;
  dynamic modReasonBy;
  dynamic removalReason;
  String? linkFlairBackgroundColor;
  String? id;
  bool? isRobotIndexable;
  int? numDuplicates;
  dynamic reportReasons;
  String? author;
  dynamic discussionType;
  int? numComments;
  bool? sendReplies;
  dynamic media;
  bool? contestMode;
  bool? authorPatreonFlair;
  dynamic authorFlairTextColor;
  String? permalink;
  String? whitelistStatus;
  bool? stickied;
  String? url;
  int? subredditSubscribers;
  int? createdUtc;
  int? numCrossposts;
  List<dynamic>? modReports;
  bool? isVideo;
  dynamic commentType;
  dynamic replies;
  String? collapsedReasonCode;
  String? parentId;
  bool? collapsed;
  String? body;
  bool? isSubmitter;
  String? bodyHtml;
  String? collapsedReason;
  dynamic associatedAward;
  dynamic unrepliableReason;
  bool? scoreHidden;
  String? linkId;
  int? controversiality;
  int? depth;
  dynamic collapsedBecauseCrowdControl;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    approvedAtUtc: json["approved_at_utc"],
    subreddit: json["subreddit"],
    selftext: json["selftext"],
    userReports: List<dynamic>.from(json["user_reports"].map((x) => x)),
    saved: json["saved"],
    modReasonTitle: json["mod_reason_title"],
    gilded: json["gilded"],
    clicked: json["clicked"],
    title: json["title"],
    linkFlairRichtext: json["link_flair_richtext"] == null ? null : List<LinkFlairRichtext>.from(json["link_flair_richtext"].map((x) => LinkFlairRichtext.fromJson(x))),
    subredditNamePrefixed: json["subreddit_name_prefixed"],
    hidden: json["hidden"],
    pwls: json["pwls"],
    linkFlairCssClass: json["link_flair_css_class"],
    downs: json["downs"],
    thumbnailHeight: json["thumbnail_height"],
    topAwardedType: json["top_awarded_type"],
    parentWhitelistStatus: json["parent_whitelist_status"],
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
    authorFullname: json["author_fullname"],
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
    authorFlairRichtext: List<dynamic>.from(json["author_flair_richtext"].map((x) => x)),
    gildings: Gildings.fromJson(json["gildings"]),
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
    urlOverriddenByDest: json["url_overridden_by_dest"],
    viewCount: json["view_count"],
    archived: json["archived"],
    noFollow: json["no_follow"],
    isCrosspostable: json["is_crosspostable"],
    pinned: json["pinned"],
    over18: json["over_18"],
    allAwardings: List<dynamic>.from(json["all_awardings"].map((x) => x)),
    awarders: List<dynamic>.from(json["awarders"].map((x) => x)),
    mediaOnly: json["media_only"],
    linkFlairTemplateId: json["link_flair_template_id"],
    canGild: json["can_gild"],
    spoiler: json["spoiler"],
    locked: json["locked"],
    authorFlairText: json["author_flair_text"],
    treatmentTags: List<dynamic>.from(json["treatment_tags"].map((x) => x)),
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
    numDuplicates: json["num_duplicates"],
    reportReasons: json["report_reasons"],
    author: json["author"],
    discussionType: json["discussion_type"],
    numComments: json["num_comments"],
    sendReplies: json["send_replies"],
    media: json["media"],
    contestMode: json["contest_mode"],
    authorPatreonFlair: json["author_patreon_flair"],
    authorFlairTextColor: json["author_flair_text_color"],
    permalink: json["permalink"],
    whitelistStatus: json["whitelist_status"],
    stickied: json["stickied"],
    url: json["url"],
    subredditSubscribers: json["subreddit_subscribers"],
    createdUtc: json["created_utc"],
    numCrossposts: json["num_crossposts"],
    modReports: List<dynamic>.from(json["mod_reports"].map((x) => x)),
    isVideo: json["is_video"],
    commentType: json["comment_type"],
    replies: json["replies"],
    collapsedReasonCode: json["collapsed_reason_code"],
    parentId: json["parent_id"],
    collapsed: json["collapsed"],
    body: json["body"],
    isSubmitter: json["is_submitter"],
    bodyHtml: json["body_html"],
    collapsedReason: json["collapsed_reason"],
    associatedAward: json["associated_award"],
    unrepliableReason: json["unrepliable_reason"],
    scoreHidden: json["score_hidden"],
    linkId: json["link_id"],
    controversiality: json["controversiality"],
    depth: json["depth"],
    collapsedBecauseCrowdControl: json["collapsed_because_crowd_control"],
  );

  Map<String, dynamic> toJson() => {
    "approved_at_utc": approvedAtUtc,
    "subreddit": subreddit,
    "selftext": selftext,
    "user_reports": List<dynamic>.from(userReports!.map((x) => x)),
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
    "parent_whitelist_status": parentWhitelistStatus,
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
    "author_fullname": authorFullname,
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
    "author_flair_richtext": List<dynamic>.from(authorFlairRichtext!.map((x) => x)),
    "gildings": gildings!.toJson(),
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
    "url_overridden_by_dest": urlOverriddenByDest,
    "view_count": viewCount,
    "archived": archived,
    "no_follow": noFollow,
    "is_crosspostable": isCrosspostable,
    "pinned": pinned,
    "over_18": over18,
    "all_awardings": List<dynamic>.from(allAwardings!.map((x) => x)),
    "awarders": List<dynamic>.from(awarders!.map((x) => x)),
    "media_only": mediaOnly,
    "link_flair_template_id": linkFlairTemplateId,
    "can_gild": canGild,
    "spoiler": spoiler,
    "locked": locked,
    "author_flair_text": authorFlairText,
    "treatment_tags": List<dynamic>.from(treatmentTags!.map((x) => x)),
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
    "num_duplicates": numDuplicates,
    "report_reasons": reportReasons,
    "author": author,
    "discussion_type": discussionType,
    "num_comments": numComments,
    "send_replies": sendReplies,
    "media": media,
    "contest_mode": contestMode,
    "author_patreon_flair": authorPatreonFlair,
    "author_flair_text_color": authorFlairTextColor,
    "permalink": permalink,
    "whitelist_status": whitelistStatus,
    "stickied": stickied,
    "url": url,
    "subreddit_subscribers": subredditSubscribers,
    "created_utc": createdUtc,
    "num_crossposts": numCrossposts,
    "mod_reports": List<dynamic>.from(modReports!.map((x) => x)),
    "is_video": isVideo,
    "comment_type": commentType,
    "replies": replies,
    "collapsed_reason_code": collapsedReasonCode,
    "parent_id": parentId,
    "collapsed": collapsed,
    "body": body,
    "is_submitter": isSubmitter,
    "body_html": bodyHtml,
    "collapsed_reason": collapsedReason,
    "associated_award": associatedAward,
    "unrepliable_reason": unrepliableReason,
    "score_hidden": scoreHidden,
    "link_id": linkId,
    "controversiality": controversiality,
    "depth": depth,
    "collapsed_because_crowd_control": collapsedBecauseCrowdControl,
  };
}

class Gildings {
  Gildings();

  factory Gildings.fromJson(Map<String, dynamic> json) => Gildings(
  );

  Map<String, dynamic> toJson() => {
  };
}

class LinkFlairRichtext {
  LinkFlairRichtext({
      this.e,
      this.t,
  });

  String? e;
  String? t;

  factory LinkFlairRichtext.fromJson(Map<String, dynamic> json) => LinkFlairRichtext(
      e: json["e"],
      t: json["t"],
  );

  Map<String, dynamic> toJson() => {
      "e": e,
      "t": t,
  };
}

class RepliesClass {
  RepliesClass({
      this.kind,
      this.data,
  });

  String? kind;
  RepliesData? data;

  factory RepliesClass.fromJson(Map<String, dynamic> json) => RepliesClass(
      kind: json["kind"],
      data: RepliesData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
      "kind": kind,
      "data": data!.toJson(),
  };
}

class RepliesData {
  RepliesData({
      this.after,
      this.dist,
      this.modhash,
      this.geoFilter,
      this.children,
      this.before,
  });

  dynamic after;
  dynamic dist;
  String? modhash;
  String? geoFilter;
  List<FluffyChild>? children;
  dynamic before;

  factory RepliesData.fromJson(Map<String, dynamic> json) => RepliesData(
      after: json["after"],
      dist: json["dist"],
      modhash: json["modhash"],
      geoFilter: json["geo_filter"],
      children: List<FluffyChild>.from(json["children"].map((x) => FluffyChild.fromJson(x))),
      before: json["before"],
  );

  Map<String, dynamic> toJson() => {
      "after": after,
      "dist": dist,
      "modhash": modhash,
      "geo_filter": geoFilter,
      "children": List<dynamic>.from(children!.map((x) => x.toJson())),
      "before": before,
  };
}

class FluffyChild {
  FluffyChild({
      this.kind,
      this.data,
  });

  String? kind;
  FluffyData? data;

  factory FluffyChild.fromJson(Map<String, dynamic> json) => FluffyChild(
      kind: json["kind"],
      data: FluffyData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
      "kind": kind,
      "data": data!.toJson(),
  };
}

class FluffyData {
  FluffyData({
    this.subredditId,
    this.approvedAtUtc,
    this.authorIsBlocked,
    this.commentType,
    this.awarders,
    this.modReasonBy,
    this.bannedBy,
    this.authorFlairType,
    this.totalAwardsReceived,
    this.subreddit,
    this.authorFlairTemplateId,
    this.likes,
    this.replies,
    this.userReports,
    this.saved,
    this.id,
    this.bannedAtUtc,
    this.modReasonTitle,
    this.gilded,
    this.archived,
    this.collapsedReasonCode,
    this.noFollow,
    this.author,
    this.canModPost,
    this.createdUtc,
    this.sendReplies,
    this.parentId,
    this.score,
    this.authorFullname,
    this.removalReason,
    this.approvedBy,
    this.modNote,
    this.allAwardings,
    this.body,
    this.edited,
    this.topAwardedType,
    this.authorFlairCssClass,
    this.name,
    this.isSubmitter,
    this.downs,
    this.authorFlairRichtext,
    this.authorPatreonFlair,
    this.bodyHtml,
    this.gildings,
    this.collapsedReason,
    this.distinguished,
    this.associatedAward,
    this.stickied,
    this.authorPremium,
    this.canGild,
    this.linkId,
    this.unrepliableReason,
    this.authorFlairTextColor,
    this.scoreHidden,
    this.permalink,
    this.subredditType,
    this.locked,
    this.reportReasons,
    this.created,
    this.authorFlairText,
    this.treatmentTags,
    this.collapsed,
    this.subredditNamePrefixed,
    this.controversiality,
    this.depth,
    this.authorFlairBackgroundColor,
    this.collapsedBecauseCrowdControl,
    this.modReports,
    this.numReports,
    this.ups,
  });

  String? subredditId;
  dynamic approvedAtUtc;
  bool? authorIsBlocked;
  dynamic commentType;
  List<dynamic>? awarders;
  dynamic modReasonBy;
  dynamic bannedBy;
  String? authorFlairType;
  int? totalAwardsReceived;
  String? subreddit;
  dynamic authorFlairTemplateId;
  dynamic likes;
  String? replies;
  List<dynamic>? userReports;
  bool? saved;
  String? id;
  dynamic bannedAtUtc;
  dynamic modReasonTitle;
  int? gilded;
  bool? archived;
  dynamic collapsedReasonCode;
  bool? noFollow;
  String? author;
  bool? canModPost;
  int? createdUtc;
  bool? sendReplies;
  String? parentId;
  int? score;
  String? authorFullname;
  dynamic removalReason;
  dynamic approvedBy;
  dynamic modNote;
  List<dynamic>? allAwardings;
  String? body;
  bool? edited;
  dynamic topAwardedType;
  dynamic authorFlairCssClass;
  String? name;
  bool? isSubmitter;
  int? downs;
  List<dynamic>? authorFlairRichtext;
  bool? authorPatreonFlair;
  String? bodyHtml;
  Gildings? gildings;
  dynamic collapsedReason;
  dynamic distinguished;
  dynamic associatedAward;
  bool? stickied;
  bool? authorPremium;
  bool? canGild;
  String? linkId;
  dynamic unrepliableReason;
  dynamic authorFlairTextColor;
  bool? scoreHidden;
  String? permalink;
  String? subredditType;
  bool? locked;
  dynamic reportReasons;
  int? created;
  dynamic authorFlairText;
  List<dynamic>? treatmentTags;
  bool? collapsed;
  String? subredditNamePrefixed;
  int? controversiality;
  int? depth;
  dynamic authorFlairBackgroundColor;
  dynamic collapsedBecauseCrowdControl;
  List<dynamic>? modReports;
  dynamic numReports;
  int? ups;

  factory FluffyData.fromJson(Map<String, dynamic> json) => FluffyData(
    subredditId: json["subreddit_id"],
    approvedAtUtc: json["approved_at_utc"],
    authorIsBlocked: json["author_is_blocked"],
    commentType: json["comment_type"],
    awarders: List<dynamic>.from(json["awarders"].map((x) => x)),
    modReasonBy: json["mod_reason_by"],
    bannedBy: json["banned_by"],
    authorFlairType: json["author_flair_type"],
    totalAwardsReceived: json["total_awards_received"],
    subreddit: json["subreddit"],
    authorFlairTemplateId: json["author_flair_template_id"],
    likes: json["likes"],
    replies: json["replies"],
    userReports: List<dynamic>.from(json["user_reports"].map((x) => x)),
    saved: json["saved"],
    id: json["id"],
    bannedAtUtc: json["banned_at_utc"],
    modReasonTitle: json["mod_reason_title"],
    gilded: json["gilded"],
    archived: json["archived"],
    collapsedReasonCode: json["collapsed_reason_code"],
    noFollow: json["no_follow"],
    author: json["author"],
    canModPost: json["can_mod_post"],
    createdUtc: json["created_utc"],
    sendReplies: json["send_replies"],
    parentId: json["parent_id"],
    score: json["score"],
    authorFullname: json["author_fullname"],
    removalReason: json["removal_reason"],
    approvedBy: json["approved_by"],
    modNote: json["mod_note"],
    allAwardings: List<dynamic>.from(json["all_awardings"].map((x) => x)),
    body: json["body"],
    edited: json["edited"],
    topAwardedType: json["top_awarded_type"],
    authorFlairCssClass: json["author_flair_css_class"],
    name: json["name"],
    isSubmitter: json["is_submitter"],
    downs: json["downs"],
    authorFlairRichtext: List<dynamic>.from(json["author_flair_richtext"].map((x) => x)),
    authorPatreonFlair: json["author_patreon_flair"],
    bodyHtml: json["body_html"],
    gildings: Gildings.fromJson(json["gildings"]),
    collapsedReason: json["collapsed_reason"],
    distinguished: json["distinguished"],
    associatedAward: json["associated_award"],
    stickied: json["stickied"],
    authorPremium: json["author_premium"],
    canGild: json["can_gild"],
    linkId: json["link_id"],
    unrepliableReason: json["unrepliable_reason"],
    authorFlairTextColor: json["author_flair_text_color"],
    scoreHidden: json["score_hidden"],
    permalink: json["permalink"],
    subredditType: json["subreddit_type"],
    locked: json["locked"],
    reportReasons: json["report_reasons"],
    created: json["created"],
    authorFlairText: json["author_flair_text"],
    treatmentTags: List<dynamic>.from(json["treatment_tags"].map((x) => x)),
    collapsed: json["collapsed"],
    subredditNamePrefixed: json["subreddit_name_prefixed"],
    controversiality: json["controversiality"],
    depth: json["depth"],
    authorFlairBackgroundColor: json["author_flair_background_color"],
    collapsedBecauseCrowdControl: json["collapsed_because_crowd_control"],
    modReports: List<dynamic>.from(json["mod_reports"].map((x) => x)),
    numReports: json["num_reports"],
    ups: json["ups"],
  );

  Map<String, dynamic> toJson() => {
    "subreddit_id": subredditId,
    "approved_at_utc": approvedAtUtc,
    "author_is_blocked": authorIsBlocked,
    "comment_type": commentType,
    "awarders": List<dynamic>.from(awarders!.map((x) => x)),
    "mod_reason_by": modReasonBy,
    "banned_by": bannedBy,
    "author_flair_type": authorFlairType,
    "total_awards_received": totalAwardsReceived,
    "subreddit": subreddit,
    "author_flair_template_id": authorFlairTemplateId,
    "likes": likes,
    "replies": replies,
    "user_reports": List<dynamic>.from(userReports!.map((x) => x)),
    "saved": saved,
    "id": id,
    "banned_at_utc": bannedAtUtc,
    "mod_reason_title": modReasonTitle,
    "gilded": gilded,
    "archived": archived,
    "collapsed_reason_code": collapsedReasonCode,
    "no_follow": noFollow,
    "author": author,
    "can_mod_post": canModPost,
    "created_utc": createdUtc,
    "send_replies": sendReplies,
    "parent_id": parentId,
    "score": score,
    "author_fullname": authorFullname,
    "removal_reason": removalReason,
    "approved_by": approvedBy,
    "mod_note": modNote,
    "all_awardings": List<dynamic>.from(allAwardings!.map((x) => x)),
    "body": body,
    "edited": edited,
    "top_awarded_type": topAwardedType,
    "author_flair_css_class": authorFlairCssClass,
    "name": name,
    "is_submitter": isSubmitter,
    "downs": downs,
    "author_flair_richtext": List<dynamic>.from(authorFlairRichtext!.map((x) => x)),
    "author_patreon_flair": authorPatreonFlair,
    "body_html": bodyHtml,
    "gildings": gildings!.toJson(),
    "collapsed_reason": collapsedReason,
    "distinguished": distinguished,
    "associated_award": associatedAward,
    "stickied": stickied,
    "author_premium": authorPremium,
    "can_gild": canGild,
    "link_id": linkId,
    "unrepliable_reason": unrepliableReason,
    "author_flair_text_color": authorFlairTextColor,
    "score_hidden": scoreHidden,
    "permalink": permalink,
    "subreddit_type": subredditType,
    "locked": locked,
    "report_reasons": reportReasons,
    "created": created,
    "author_flair_text": authorFlairText,
    "treatment_tags": List<dynamic>.from(treatmentTags!.map((x) => x)),
    "collapsed": collapsed,
    "subreddit_name_prefixed": subredditNamePrefixed,
    "controversiality": controversiality,
    "depth": depth,
    "author_flair_background_color": authorFlairBackgroundColor,
    "collapsed_because_crowd_control": collapsedBecauseCrowdControl,
    "mod_reports": List<dynamic>.from(modReports!.map((x) => x)),
    "num_reports": numReports,
    "ups": ups,
  };
}
