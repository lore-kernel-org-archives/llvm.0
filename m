Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD7F6E2BE;
	Mon, 18 Nov 2024 03:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731900553; cv=none; b=nMTuprES81fkAwVOQj6v+MPALRWtygn60bioUt8kkg8Ytp/TuqG2LR0UXmPUGCPABbf7ogElgXj7jQyOKfCV+Msq/xkBXDaGlQFvku94e05awG70XAO6n43H8HIOT/l2p51o/SOhzy64S1lLAxfMM8dUQRxXfAOl6/J8TlJlch4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731900553; c=relaxed/simple;
	bh=YZeBntUFDPVMvVs+zLA3d9eUU+x3vquw0nGvk04KY00=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OFv1vVT60FEJc1bkj4PApUx/vBM8ZpSXY/jpnISzNFJP0kpE7D6NuWI2hurg+QB+BHKRvgWAqLOMQcdQRA1RVqIuZNDQCTCEe0It6ULM48ajHUGtPKa/OwWWeqcjBSyty9MJYlAbPswXIhL/COk18hMrX/zcSPwn4edhPwo6rCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AeFFkAuX; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AeFFkAuX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731900551; x=1763436551;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YZeBntUFDPVMvVs+zLA3d9eUU+x3vquw0nGvk04KY00=;
  b=AeFFkAuXHsCYeTHsc+vmpvs/4FAebpfotB2kdfnF7sJWh5inWPdl6dlS
   MzX+MNlZUrIGdScCyuik4MJUa7eEeUuLbBmb58lN/os5OS7x3zj1Ay0dR
   f+HVXfMMDARCAstGJOr/BvH4ACdllZ5t/rBDsiz4f2tr2Wa9yZpTWmcnu
   JL7hGUAv1rxW5tWk2DzAwkNz22u393Mz+bXvGl9x4iwAuCwN+AOWGxvpf
   WmIACcBH6vuGJDhdMmCEFDxa6YhDIGJDJQEb/f/7mf0SMAiWaTSzEfPYE
   3IGf7x50vr0U9VWPV19Y30A6i31E6SXqOfb55xPaM4LiU9i/x9LBEJH/U
   w==;
X-CSE-ConnectionGUID: VaJ2+VRMQOCQ4Z9smB3bVw==
X-CSE-MsgGUID: 4MNNH4asRbqHFQRUpSzQvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31762003"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="31762003"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 19:29:07 -0800
X-CSE-ConnectionGUID: SjQYKb3oQXOaSumyINISIQ==
X-CSE-MsgGUID: DfIqEgc0TKi+ihofgLAAdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="89495921"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Nov 2024 19:29:06 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCsRj-0002Fd-2R;
	Mon, 18 Nov 2024 03:29:03 +0000
Date: Mon, 18 Nov 2024 11:29:00 +0800
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [samba-ksmbd:for-next 4/8] fs/smb/client/fs_context.c:1306:17:
 warning: equality comparison result unused
Message-ID: <202411181139.yMLc37vd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.samba.org/ksmbd.git for-next
head:   74dd969febbf9f16ca03f880b2020906e1666227
commit: f4efd0937eeb59de552bcfab2305e19b2a381913 [4/8] smb3 client: minor cleanup of username parsing on mount
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241118/202411181139.yMLc37vd-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411181139.yMLc37vd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411181139.yMLc37vd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/smb/client/fs_context.c:22:
   In file included from include/linux/fs_context.h:14:
   In file included from include/linux/security.h:33:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> fs/smb/client/fs_context.c:1306:17: warning: equality comparison result unused [-Wunused-comparison]
    1306 |                 param->string == NULL;
         |                 ~~~~~~~~~~~~~~^~~~~~~
   fs/smb/client/fs_context.c:1306:17: note: use '=' to turn this equality comparison into an assignment
    1306 |                 param->string == NULL;
         |                               ^~
         |                               =
>> fs/smb/client/fs_context.c:1304:34: warning: expression result unused [-Wunused-value]
    1304 |                 ctx->username = param->string, GFP_KERNEL;
         |                                                ^~~~~~~~~~
   include/linux/gfp_types.h:378:46: note: expanded from macro 'GFP_KERNEL'
     378 | #define GFP_KERNEL      (__GFP_RECLAIM | __GFP_IO | __GFP_FS)
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~
   6 warnings generated.


vim +1306 fs/smb/client/fs_context.c

   954	
   955	static int smb3_fs_context_parse_param(struct fs_context *fc,
   956					      struct fs_parameter *param)
   957	{
   958		struct fs_parse_result result;
   959		struct smb3_fs_context *ctx = smb3_fc2context(fc);
   960		int i, opt;
   961		bool is_smb3 = !strcmp(fc->fs_type->name, "smb3");
   962		bool skip_parsing = false;
   963	
   964		cifs_dbg(FYI, "CIFS: parsing cifs mount option '%s'\n", param->key);
   965	
   966		/*
   967		 * fs_parse can not handle string options with an empty value so
   968		 * we will need special handling of them.
   969		 */
   970		if (param->type == fs_value_is_string && param->string[0] == 0) {
   971			if (!strcmp("pass", param->key) || !strcmp("password", param->key)) {
   972				skip_parsing = true;
   973				opt = Opt_pass;
   974			} else if (!strcmp("user", param->key) || !strcmp("username", param->key)) {
   975				skip_parsing = true;
   976				opt = Opt_user;
   977			}
   978		}
   979	
   980		if (!skip_parsing) {
   981			opt = fs_parse(fc, smb3_fs_parameters, param, &result);
   982			if (opt < 0)
   983				return ctx->sloppy ? 1 : opt;
   984		}
   985	
   986		switch (opt) {
   987		case Opt_compress:
   988			if (!IS_ENABLED(CONFIG_CIFS_COMPRESSION)) {
   989				cifs_errorf(fc, "CONFIG_CIFS_COMPRESSION kernel config option is unset\n");
   990				goto cifs_parse_mount_err;
   991			}
   992			ctx->compress = true;
   993			cifs_dbg(VFS, "SMB3 compression support is experimental\n");
   994			break;
   995		case Opt_nodfs:
   996			ctx->nodfs = 1;
   997			break;
   998		case Opt_hard:
   999			if (result.negated) {
  1000				if (ctx->retry == 1)
  1001					cifs_dbg(VFS, "conflicting hard vs. soft mount options\n");
  1002				ctx->retry = 0;
  1003			} else
  1004				ctx->retry = 1;
  1005			break;
  1006		case Opt_soft:
  1007			if (result.negated)
  1008				ctx->retry = 1;
  1009			else {
  1010				if (ctx->retry == 1)
  1011					cifs_dbg(VFS, "conflicting hard vs soft mount options\n");
  1012				ctx->retry = 0;
  1013			}
  1014			break;
  1015		case Opt_mapposix:
  1016			if (result.negated)
  1017				ctx->remap = false;
  1018			else {
  1019				ctx->remap = true;
  1020				ctx->sfu_remap = false; /* disable SFU mapping */
  1021			}
  1022			break;
  1023		case Opt_mapchars:
  1024			if (result.negated)
  1025				ctx->sfu_remap = false;
  1026			else {
  1027				ctx->sfu_remap = true;
  1028				ctx->remap = false; /* disable SFM (mapposix) mapping */
  1029			}
  1030			break;
  1031		case Opt_user_xattr:
  1032			if (result.negated)
  1033				ctx->no_xattr = 1;
  1034			else
  1035				ctx->no_xattr = 0;
  1036			break;
  1037		case Opt_forceuid:
  1038			if (result.negated)
  1039				ctx->override_uid = 0;
  1040			else
  1041				ctx->override_uid = 1;
  1042			ctx->forceuid_specified = true;
  1043			break;
  1044		case Opt_forcegid:
  1045			if (result.negated)
  1046				ctx->override_gid = 0;
  1047			else
  1048				ctx->override_gid = 1;
  1049			ctx->forcegid_specified = true;
  1050			break;
  1051		case Opt_perm:
  1052			if (result.negated)
  1053				ctx->noperm = 1;
  1054			else
  1055				ctx->noperm = 0;
  1056			break;
  1057		case Opt_dynperm:
  1058			if (result.negated)
  1059				ctx->dynperm = 0;
  1060			else
  1061				ctx->dynperm = 1;
  1062			break;
  1063		case Opt_sfu:
  1064			if (result.negated)
  1065				ctx->sfu_emul = 0;
  1066			else
  1067				ctx->sfu_emul = 1;
  1068			break;
  1069		case Opt_noblocksend:
  1070			ctx->noblocksnd = 1;
  1071			break;
  1072		case Opt_noautotune:
  1073			ctx->noautotune = 1;
  1074			break;
  1075		case Opt_nolease:
  1076			ctx->no_lease = 1;
  1077			break;
  1078		case Opt_nosparse:
  1079			ctx->no_sparse = 1;
  1080			break;
  1081		case Opt_nodelete:
  1082			ctx->nodelete = 1;
  1083			break;
  1084		case Opt_multichannel:
  1085			if (result.negated) {
  1086				ctx->multichannel = false;
  1087				ctx->max_channels = 1;
  1088			} else {
  1089				ctx->multichannel = true;
  1090				/* if number of channels not specified, default to 2 */
  1091				if (ctx->max_channels < 2)
  1092					ctx->max_channels = 2;
  1093			}
  1094			break;
  1095		case Opt_uid:
  1096			ctx->linux_uid = result.uid;
  1097			ctx->uid_specified = true;
  1098			break;
  1099		case Opt_cruid:
  1100			ctx->cred_uid = result.uid;
  1101			ctx->cruid_specified = true;
  1102			break;
  1103		case Opt_backupuid:
  1104			ctx->backupuid = result.uid;
  1105			ctx->backupuid_specified = true;
  1106			break;
  1107		case Opt_backupgid:
  1108			ctx->backupgid = result.gid;
  1109			ctx->backupgid_specified = true;
  1110			break;
  1111		case Opt_gid:
  1112			ctx->linux_gid = result.gid;
  1113			ctx->gid_specified = true;
  1114			break;
  1115		case Opt_port:
  1116			ctx->port = result.uint_32;
  1117			break;
  1118		case Opt_file_mode:
  1119			ctx->file_mode = result.uint_32;
  1120			break;
  1121		case Opt_dirmode:
  1122			ctx->dir_mode = result.uint_32;
  1123			break;
  1124		case Opt_min_enc_offload:
  1125			ctx->min_offload = result.uint_32;
  1126			break;
  1127		case Opt_retrans:
  1128			ctx->retrans = result.uint_32;
  1129			break;
  1130		case Opt_blocksize:
  1131			/*
  1132			 * inode blocksize realistically should never need to be
  1133			 * less than 16K or greater than 16M and default is 1MB.
  1134			 * Note that small inode block sizes (e.g. 64K) can lead
  1135			 * to very poor performance of common tools like cp and scp
  1136			 */
  1137			if ((result.uint_32 < CIFS_MAX_MSGSIZE) ||
  1138			   (result.uint_32 > (4 * SMB3_DEFAULT_IOSIZE))) {
  1139				cifs_errorf(fc, "%s: Invalid blocksize\n",
  1140					__func__);
  1141				goto cifs_parse_mount_err;
  1142			}
  1143			ctx->bsize = result.uint_32;
  1144			ctx->got_bsize = true;
  1145			break;
  1146		case Opt_rasize:
  1147			/*
  1148			 * readahead size realistically should never need to be
  1149			 * less than 1M (CIFS_DEFAULT_IOSIZE) or greater than 32M
  1150			 * (perhaps an exception should be considered in the
  1151			 * for the case of a large number of channels
  1152			 * when multichannel is negotiated) since that would lead
  1153			 * to plenty of parallel I/O in flight to the server.
  1154			 * Note that smaller read ahead sizes would
  1155			 * hurt performance of common tools like cp and scp
  1156			 * which often trigger sequential i/o with read ahead
  1157			 */
  1158			if ((result.uint_32 > (8 * SMB3_DEFAULT_IOSIZE)) ||
  1159			    (result.uint_32 < CIFS_DEFAULT_IOSIZE)) {
  1160				cifs_errorf(fc, "%s: Invalid rasize %d vs. %d\n",
  1161					__func__, result.uint_32, SMB3_DEFAULT_IOSIZE);
  1162				goto cifs_parse_mount_err;
  1163			}
  1164			ctx->rasize = result.uint_32;
  1165			break;
  1166		case Opt_rsize:
  1167			ctx->rsize = result.uint_32;
  1168			ctx->got_rsize = true;
  1169			break;
  1170		case Opt_wsize:
  1171			ctx->wsize = result.uint_32;
  1172			ctx->got_wsize = true;
  1173			if (ctx->wsize % PAGE_SIZE != 0) {
  1174				ctx->wsize = round_down(ctx->wsize, PAGE_SIZE);
  1175				if (ctx->wsize == 0) {
  1176					ctx->wsize = PAGE_SIZE;
  1177					cifs_dbg(VFS, "wsize too small, reset to minimum %ld\n", PAGE_SIZE);
  1178				} else {
  1179					cifs_dbg(VFS,
  1180						 "wsize rounded down to %d to multiple of PAGE_SIZE %ld\n",
  1181						 ctx->wsize, PAGE_SIZE);
  1182				}
  1183			}
  1184			break;
  1185		case Opt_acregmax:
  1186			ctx->acregmax = HZ * result.uint_32;
  1187			if (ctx->acregmax > CIFS_MAX_ACTIMEO) {
  1188				cifs_errorf(fc, "acregmax too large\n");
  1189				goto cifs_parse_mount_err;
  1190			}
  1191			break;
  1192		case Opt_acdirmax:
  1193			ctx->acdirmax = HZ * result.uint_32;
  1194			if (ctx->acdirmax > CIFS_MAX_ACTIMEO) {
  1195				cifs_errorf(fc, "acdirmax too large\n");
  1196				goto cifs_parse_mount_err;
  1197			}
  1198			break;
  1199		case Opt_actimeo:
  1200			if (HZ * result.uint_32 > CIFS_MAX_ACTIMEO) {
  1201				cifs_errorf(fc, "timeout too large\n");
  1202				goto cifs_parse_mount_err;
  1203			}
  1204			if ((ctx->acdirmax != CIFS_DEF_ACTIMEO) ||
  1205			    (ctx->acregmax != CIFS_DEF_ACTIMEO)) {
  1206				cifs_errorf(fc, "actimeo ignored since acregmax or acdirmax specified\n");
  1207				break;
  1208			}
  1209			ctx->acdirmax = ctx->acregmax = HZ * result.uint_32;
  1210			break;
  1211		case Opt_closetimeo:
  1212			ctx->closetimeo = HZ * result.uint_32;
  1213			if (ctx->closetimeo > SMB3_MAX_DCLOSETIMEO) {
  1214				cifs_errorf(fc, "closetimeo too large\n");
  1215				goto cifs_parse_mount_err;
  1216			}
  1217			break;
  1218		case Opt_echo_interval:
  1219			ctx->echo_interval = result.uint_32;
  1220			break;
  1221		case Opt_snapshot:
  1222			ctx->snapshot_time = result.uint_64;
  1223			break;
  1224		case Opt_max_credits:
  1225			if (result.uint_32 < 20 || result.uint_32 > 60000) {
  1226				cifs_errorf(fc, "%s: Invalid max_credits value\n",
  1227					 __func__);
  1228				goto cifs_parse_mount_err;
  1229			}
  1230			ctx->max_credits = result.uint_32;
  1231			break;
  1232		case Opt_max_channels:
  1233			if (result.uint_32 < 1 || result.uint_32 > CIFS_MAX_CHANNELS) {
  1234				cifs_errorf(fc, "%s: Invalid max_channels value, needs to be 1-%d\n",
  1235					 __func__, CIFS_MAX_CHANNELS);
  1236				goto cifs_parse_mount_err;
  1237			}
  1238			ctx->max_channels = result.uint_32;
  1239			/* If more than one channel requested ... they want multichan */
  1240			if (result.uint_32 > 1)
  1241				ctx->multichannel = true;
  1242			break;
  1243		case Opt_max_cached_dirs:
  1244			if (result.uint_32 < 1) {
  1245				cifs_errorf(fc, "%s: Invalid max_cached_dirs, needs to be 1 or more\n",
  1246					    __func__);
  1247				goto cifs_parse_mount_err;
  1248			}
  1249			ctx->max_cached_dirs = result.uint_32;
  1250			break;
  1251		case Opt_handletimeout:
  1252			ctx->handle_timeout = result.uint_32;
  1253			if (ctx->handle_timeout > SMB3_MAX_HANDLE_TIMEOUT) {
  1254				cifs_errorf(fc, "Invalid handle cache timeout, longer than 16 minutes\n");
  1255				goto cifs_parse_mount_err;
  1256			}
  1257			break;
  1258		case Opt_source:
  1259			kfree(ctx->UNC);
  1260			ctx->UNC = NULL;
  1261			switch (smb3_parse_devname(param->string, ctx)) {
  1262			case 0:
  1263				break;
  1264			case -ENOMEM:
  1265				cifs_errorf(fc, "Unable to allocate memory for devname\n");
  1266				goto cifs_parse_mount_err;
  1267			case -EINVAL:
  1268				cifs_errorf(fc, "Malformed UNC in devname\n");
  1269				goto cifs_parse_mount_err;
  1270			default:
  1271				cifs_errorf(fc, "Unknown error parsing devname\n");
  1272				goto cifs_parse_mount_err;
  1273			}
  1274			ctx->source = smb3_fs_context_fullpath(ctx, '/');
  1275			if (IS_ERR(ctx->source)) {
  1276				ctx->source = NULL;
  1277				cifs_errorf(fc, "OOM when copying UNC string\n");
  1278				goto cifs_parse_mount_err;
  1279			}
  1280			fc->source = kstrdup(ctx->source, GFP_KERNEL);
  1281			if (fc->source == NULL) {
  1282				cifs_errorf(fc, "OOM when copying UNC string\n");
  1283				goto cifs_parse_mount_err;
  1284			}
  1285			break;
  1286		case Opt_user:
  1287			kfree(ctx->username);
  1288			ctx->username = NULL;
  1289			if (ctx->nullauth)
  1290				break;
  1291	
  1292			/* if first character is null, then anonymous auth */
  1293			if (*(param->string) == 0) {
  1294				/* null user, ie. anonymous authentication */
  1295				ctx->nullauth = 1;
  1296				break;
  1297			}
  1298	
  1299			if (strnlen(param->string, CIFS_MAX_USERNAME_LEN) >
  1300			    CIFS_MAX_USERNAME_LEN) {
  1301				pr_warn("username too long\n");
  1302				goto cifs_parse_mount_err;
  1303			}
> 1304			ctx->username = param->string, GFP_KERNEL;
  1305			/* streal string from caller, but set to NULL so caller doesn't free */
> 1306			param->string == NULL;
  1307			break;
  1308		case Opt_pass:
  1309			kfree_sensitive(ctx->password);
  1310			ctx->password = NULL;
  1311			if (strlen(param->string) == 0)
  1312				break;
  1313	
  1314			ctx->password = kstrdup(param->string, GFP_KERNEL);
  1315			if (ctx->password == NULL) {
  1316				cifs_errorf(fc, "OOM when copying password string\n");
  1317				goto cifs_parse_mount_err;
  1318			}
  1319			break;
  1320		case Opt_pass2:
  1321			kfree_sensitive(ctx->password2);
  1322			ctx->password2 = NULL;
  1323			if (strlen(param->string) == 0)
  1324				break;
  1325	
  1326			ctx->password2 = kstrdup(param->string, GFP_KERNEL);
  1327			if (ctx->password2 == NULL) {
  1328				cifs_errorf(fc, "OOM when copying password2 string\n");
  1329				goto cifs_parse_mount_err;
  1330			}
  1331			break;
  1332		case Opt_ip:
  1333			if (strlen(param->string) == 0) {
  1334				ctx->got_ip = false;
  1335				break;
  1336			}
  1337			if (!cifs_convert_address((struct sockaddr *)&ctx->dstaddr,
  1338						  param->string,
  1339						  strlen(param->string))) {
  1340				pr_err("bad ip= option (%s)\n", param->string);
  1341				goto cifs_parse_mount_err;
  1342			}
  1343			ctx->got_ip = true;
  1344			break;
  1345		case Opt_domain:
  1346			if (strnlen(param->string, CIFS_MAX_DOMAINNAME_LEN)
  1347					== CIFS_MAX_DOMAINNAME_LEN) {
  1348				pr_warn("domain name too long\n");
  1349				goto cifs_parse_mount_err;
  1350			}
  1351	
  1352			kfree(ctx->domainname);
  1353			ctx->domainname = kstrdup(param->string, GFP_KERNEL);
  1354			if (ctx->domainname == NULL) {
  1355				cifs_errorf(fc, "OOM when copying domainname string\n");
  1356				goto cifs_parse_mount_err;
  1357			}
  1358			cifs_dbg(FYI, "Domain name set\n");
  1359			break;
  1360		case Opt_srcaddr:
  1361			if (!cifs_convert_address(
  1362					(struct sockaddr *)&ctx->srcaddr,
  1363					param->string, strlen(param->string))) {
  1364				pr_warn("Could not parse srcaddr: %s\n",
  1365					param->string);
  1366				goto cifs_parse_mount_err;
  1367			}
  1368			break;
  1369		case Opt_iocharset:
  1370			if (strnlen(param->string, 1024) >= 65) {
  1371				pr_warn("iocharset name too long\n");
  1372				goto cifs_parse_mount_err;
  1373			}
  1374	
  1375			if (strncasecmp(param->string, "default", 7) != 0) {
  1376				kfree(ctx->iocharset);
  1377				ctx->iocharset = kstrdup(param->string, GFP_KERNEL);
  1378				if (ctx->iocharset == NULL) {
  1379					cifs_errorf(fc, "OOM when copying iocharset string\n");
  1380					goto cifs_parse_mount_err;
  1381				}
  1382			}
  1383			/* if iocharset not set then load_nls_default
  1384			 * is used by caller
  1385			 */
  1386			cifs_dbg(FYI, "iocharset set to %s\n", ctx->iocharset);
  1387			break;
  1388		case Opt_netbiosname:
  1389			memset(ctx->source_rfc1001_name, 0x20,
  1390				RFC1001_NAME_LEN);
  1391			/*
  1392			 * FIXME: are there cases in which a comma can
  1393			 * be valid in workstation netbios name (and
  1394			 * need special handling)?
  1395			 */
  1396			for (i = 0; i < RFC1001_NAME_LEN; i++) {
  1397				/* don't ucase netbiosname for user */
  1398				if (param->string[i] == 0)
  1399					break;
  1400				ctx->source_rfc1001_name[i] = param->string[i];
  1401			}
  1402			/* The string has 16th byte zero still from
  1403			 * set at top of the function
  1404			 */
  1405			if (i == RFC1001_NAME_LEN && param->string[i] != 0)
  1406				pr_warn("netbiosname longer than 15 truncated\n");
  1407			break;
  1408		case Opt_servern:
  1409			/* last byte, type, is 0x20 for servr type */
  1410			memset(ctx->target_rfc1001_name, 0x20,
  1411				RFC1001_NAME_LEN_WITH_NULL);
  1412			/*
  1413			 * BB are there cases in which a comma can be valid in this
  1414			 * workstation netbios name (and need special handling)?
  1415			 */
  1416	
  1417			/* user or mount helper must uppercase the netbios name */
  1418			for (i = 0; i < 15; i++) {
  1419				if (param->string[i] == 0)
  1420					break;
  1421				ctx->target_rfc1001_name[i] = param->string[i];
  1422			}
  1423	
  1424			/* The string has 16th byte zero still from set at top of function */
  1425			if (i == RFC1001_NAME_LEN && param->string[i] != 0)
  1426				pr_warn("server netbiosname longer than 15 truncated\n");
  1427			break;
  1428		case Opt_ver:
  1429			/* version of mount userspace tools, not dialect */
  1430			/* If interface changes in mount.cifs bump to new ver */
  1431			if (strncasecmp(param->string, "1", 1) == 0) {
  1432				if (strlen(param->string) > 1) {
  1433					pr_warn("Bad mount helper ver=%s. Did you want SMB1 (CIFS) dialect and mean to type vers=1.0 instead?\n",
  1434						param->string);
  1435					goto cifs_parse_mount_err;
  1436				}
  1437				/* This is the default */
  1438				break;
  1439			}
  1440			/* For all other value, error */
  1441			pr_warn("Invalid mount helper version specified\n");
  1442			goto cifs_parse_mount_err;
  1443		case Opt_vers:
  1444			/* protocol version (dialect) */
  1445			if (cifs_parse_smb_version(fc, param->string, ctx, is_smb3) != 0)
  1446				goto cifs_parse_mount_err;
  1447			ctx->got_version = true;
  1448			break;
  1449		case Opt_sec:
  1450			if (cifs_parse_security_flavors(fc, param->string, ctx) != 0)
  1451				goto cifs_parse_mount_err;
  1452			break;
  1453		case Opt_cache:
  1454			if (cifs_parse_cache_flavor(fc, param->string, ctx) != 0)
  1455				goto cifs_parse_mount_err;
  1456			break;
  1457		case Opt_witness:
  1458	#ifndef CONFIG_CIFS_SWN_UPCALL
  1459			cifs_errorf(fc, "Witness support needs CONFIG_CIFS_SWN_UPCALL config option\n");
  1460				goto cifs_parse_mount_err;
  1461	#endif
  1462			ctx->witness = true;
  1463			pr_warn_once("Witness protocol support is experimental\n");
  1464			break;
  1465		case Opt_rootfs:
  1466	#ifndef CONFIG_CIFS_ROOT
  1467			cifs_dbg(VFS, "rootfs support requires CONFIG_CIFS_ROOT config option\n");
  1468			goto cifs_parse_mount_err;
  1469	#endif
  1470			ctx->rootfs = true;
  1471			break;
  1472		case Opt_posixpaths:
  1473			if (result.negated)
  1474				ctx->posix_paths = 0;
  1475			else
  1476				ctx->posix_paths = 1;
  1477			break;
  1478		case Opt_unix:
  1479			if (result.negated) {
  1480				if (ctx->linux_ext == 1)
  1481					pr_warn_once("conflicting posix mount options specified\n");
  1482				ctx->linux_ext = 0;
  1483				ctx->no_linux_ext = 1;
  1484			} else {
  1485				if (ctx->no_linux_ext == 1)
  1486					pr_warn_once("conflicting posix mount options specified\n");
  1487				ctx->linux_ext = 1;
  1488				ctx->no_linux_ext = 0;
  1489			}
  1490			break;
  1491		case Opt_nocase:
  1492			ctx->nocase = 1;
  1493			break;
  1494		case Opt_brl:
  1495			if (result.negated) {
  1496				/*
  1497				 * turn off mandatory locking in mode
  1498				 * if remote locking is turned off since the
  1499				 * local vfs will do advisory
  1500				 */
  1501				if (ctx->file_mode ==
  1502					(S_IALLUGO & ~(S_ISUID | S_IXGRP)))
  1503					ctx->file_mode = S_IALLUGO;
  1504				ctx->nobrl =  1;
  1505			} else
  1506				ctx->nobrl =  0;
  1507			break;
  1508		case Opt_handlecache:
  1509			if (result.negated)
  1510				ctx->nohandlecache = 1;
  1511			else
  1512				ctx->nohandlecache = 0;
  1513			break;
  1514		case Opt_forcemandatorylock:
  1515			ctx->mand_lock = 1;
  1516			break;
  1517		case Opt_setuids:
  1518			ctx->setuids = result.negated;
  1519			break;
  1520		case Opt_intr:
  1521			ctx->intr = !result.negated;
  1522			break;
  1523		case Opt_setuidfromacl:
  1524			ctx->setuidfromacl = 1;
  1525			break;
  1526		case Opt_strictsync:
  1527			ctx->nostrictsync = result.negated;
  1528			break;
  1529		case Opt_serverino:
  1530			ctx->server_ino = !result.negated;
  1531			break;
  1532		case Opt_rwpidforward:
  1533			ctx->rwpidforward = 1;
  1534			break;
  1535		case Opt_modesid:
  1536			ctx->mode_ace = 1;
  1537			break;
  1538		case Opt_cifsacl:
  1539			ctx->cifs_acl = !result.negated;
  1540			break;
  1541		case Opt_acl:
  1542			ctx->no_psx_acl = result.negated;
  1543			break;
  1544		case Opt_locallease:
  1545			ctx->local_lease = 1;
  1546			break;
  1547		case Opt_sign:
  1548			ctx->sign = true;
  1549			break;
  1550		case Opt_ignore_signature:
  1551			ctx->sign = true;
  1552			ctx->ignore_signature = true;
  1553			break;
  1554		case Opt_seal:
  1555			/* we do not do the following in secFlags because seal
  1556			 * is a per tree connection (mount) not a per socket
  1557			 * or per-smb connection option in the protocol
  1558			 * vol->secFlg |= CIFSSEC_MUST_SEAL;
  1559			 */
  1560			ctx->seal = 1;
  1561			break;
  1562		case Opt_noac:
  1563			pr_warn("Mount option noac not supported. Instead set /proc/fs/cifs/LookupCacheEnabled to 0\n");
  1564			break;
  1565		case Opt_fsc:
  1566	#ifndef CONFIG_CIFS_FSCACHE
  1567			cifs_errorf(fc, "FS-Cache support needs CONFIG_CIFS_FSCACHE kernel config option set\n");
  1568			goto cifs_parse_mount_err;
  1569	#endif
  1570			ctx->fsc = true;
  1571			break;
  1572		case Opt_mfsymlinks:
  1573			ctx->mfsymlinks = true;
  1574			break;
  1575		case Opt_multiuser:
  1576			ctx->multiuser = true;
  1577			break;
  1578		case Opt_sloppy:
  1579			ctx->sloppy = true;
  1580			break;
  1581		case Opt_nosharesock:
  1582			ctx->nosharesock = true;
  1583			break;
  1584		case Opt_persistent:
  1585			if (result.negated) {
  1586				ctx->nopersistent = true;
  1587				if (ctx->persistent) {
  1588					cifs_errorf(fc, "persistenthandles mount options conflict\n");
  1589					goto cifs_parse_mount_err;
  1590				}
  1591			} else {
  1592				ctx->persistent = true;
  1593				if ((ctx->nopersistent) || (ctx->resilient)) {
  1594					cifs_errorf(fc, "persistenthandles mount options conflict\n");
  1595					goto cifs_parse_mount_err;
  1596				}
  1597			}
  1598			break;
  1599		case Opt_resilient:
  1600			if (result.negated) {
  1601				ctx->resilient = false; /* already the default */
  1602			} else {
  1603				ctx->resilient = true;
  1604				if (ctx->persistent) {
  1605					cifs_errorf(fc, "persistenthandles mount options conflict\n");
  1606					goto cifs_parse_mount_err;
  1607				}
  1608			}
  1609			break;
  1610		case Opt_tcp_nodelay:
  1611			/* tcp nodelay should not usually be needed since we CORK/UNCORK the socket */
  1612			if (result.negated)
  1613				ctx->sockopt_tcp_nodelay = false;
  1614			else
  1615				ctx->sockopt_tcp_nodelay = true;
  1616			break;
  1617		case Opt_domainauto:
  1618			ctx->domainauto = true;
  1619			break;
  1620		case Opt_rdma:
  1621			ctx->rdma = true;
  1622			break;
  1623		case Opt_reparse:
  1624			if (parse_reparse_flavor(fc, param->string, ctx))
  1625				goto cifs_parse_mount_err;
  1626			break;
  1627		}
  1628		/* case Opt_ignore: - is ignored as expected ... */
  1629	
  1630		return 0;
  1631	
  1632	 cifs_parse_mount_err:
  1633		kfree_sensitive(ctx->password);
  1634		ctx->password = NULL;
  1635		kfree_sensitive(ctx->password2);
  1636		ctx->password2 = NULL;
  1637		return -EINVAL;
  1638	}
  1639	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
