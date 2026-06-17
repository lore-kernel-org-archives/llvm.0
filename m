Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A713FFFAF;
	Wed, 17 Jun 2026 10:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781693097; cv=none; b=nMyexuyYLG8CPQILW1kmgHK8s7OnzPTPuH1j231oBY6qm5MVg7lyi2JqPXc/zJ/ItoFqMal9a+0nAHtRYb9gR8NQaxPhDkkiL5pPTr0nrWjogoCqOvtjtXImth0WjTI3WFJ1NkBElA7D4azXVe5Gf+1qve1EUNp/+CZBWefSEV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781693097; c=relaxed/simple;
	bh=Uc8BT+mzTT/ICA76kiYpcB2XPxl7G5SqO34S/a8NR4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MZJMmzmEg+WNQnOWDGAT4Jp33+nNIvV6eCC3Ik9AvMgWfEbL7VuLnabjOaps/m1TOoKyEjZ2gmMOyxDqwzQV15E95LY9lETtrTkVwzzPcGatBOfb5trsE0exWmuz9SABUO97xB4DdrSv/zqm9Mmrz2qW0L7OYkN3kZhRJ8iKS/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CTmTb6OX; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CTmTb6OX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781693095; x=1813229095;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Uc8BT+mzTT/ICA76kiYpcB2XPxl7G5SqO34S/a8NR4Q=;
  b=CTmTb6OXlaeycYIA32g/36IlRQ7JeDQMsaFX6eFNN1KUgpHuO9PG5ywT
   q3DwXkFu1VEzWdWz2A5DOyn81qNcb07ZzFU7+E6lyXMKOeXh1BlqittRi
   NHujNWnQB8F+28+ucXnxW6IUO18IqhfNLCen5sLPPQn+dnRLtfF5+k/Pa
   YjoktWLE1N1QbCjXv0wiWVvKfNN36IHLyhqPI+JbOfh4Aw6fXC1pCQIBE
   oEhtMVHMZywJR1vovB9qzr4XjKI9Mjpkw2XJXQzzWfsf/5eJZqYT+K4Sw
   9TXfa2jWiEbUD/sYTVyQ2wzj3mC7Wvs9sOGj4RbQHJMAMF5oqJVF/PtXr
   A==;
X-CSE-ConnectionGUID: GMNTxZOmRSqJc2wlr1n6HA==
X-CSE-MsgGUID: donpszvNQwmrbVTxRxqJ7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="70014359"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="70014359"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 03:44:54 -0700
X-CSE-ConnectionGUID: oggmQ/chTC+mxk43D59z+g==
X-CSE-MsgGUID: ZqZhAN1MRKCdu/D6bVIsmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="241672169"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Jun 2026 03:44:51 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZnlI-00000000UNu-3pyb;
	Wed, 17 Jun 2026 10:44:48 +0000
Date: Wed, 17 Jun 2026 18:43:54 +0800
From: kernel test robot <lkp@intel.com>
To: Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	jason.wessel@windriver.com, danielt@kernel.org,
	dianders@chromium.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kdb: use sizeof(kdb_prompt_str) instead of mismatched
 CMD_BUFLEN
Message-ID: <202606171818.9AqxpkQ1-lkp@intel.com>
References: <uqjlxgcu6y6ukayda7jka7ji73ctkj4f3632rejud6cqqayfwx@kuyf2f2lvett>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <uqjlxgcu6y6ukayda7jka7ji73ctkj4f3632rejud6cqqayfwx@kuyf2f2lvett>

Hi Naveen,

kernel test robot noticed the following build errors:

[auto build test ERROR on v7.1]
[also build test ERROR on linus/master next-20260616]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Naveen-Kumar-Chaudhary/kdb-use-sizeof-kdb_prompt_str-instead-of-mismatched-CMD_BUFLEN/20260617-055312
base:   v7.1
patch link:    https://lore.kernel.org/r/uqjlxgcu6y6ukayda7jka7ji73ctkj4f3632rejud6cqqayfwx%40kuyf2f2lvett
patch subject: [PATCH] kdb: use sizeof(kdb_prompt_str) instead of mismatched CMD_BUFLEN
config: hexagon-randconfig-001-20260617 (https://download.01.org/0day-ci/archive/20260617/202606171818.9AqxpkQ1-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260617/202606171818.9AqxpkQ1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606171818.9AqxpkQ1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/debug/kdb/kdb_main.c:1268:34: error: invalid application of 'sizeof' to an incomplete type 'char[]'
    1268 |                 snprintf(kdb_prompt_str, sizeof(kdb_prompt_str),
         |                                                ^~~~~~~~~~~~~~~~
   1 error generated.


vim +1268 kernel/debug/kdb/kdb_main.c

  1124	
  1125	/*
  1126	 * kdb_local - The main code for kdb.  This routine is invoked on a
  1127	 *	specific processor, it is not global.  The main kdb() routine
  1128	 *	ensures that only one processor at a time is in this routine.
  1129	 *	This code is called with the real reason code on the first
  1130	 *	entry to a kdb session, thereafter it is called with reason
  1131	 *	SWITCH, even if the user goes back to the original cpu.
  1132	 * Inputs:
  1133	 *	reason		The reason KDB was invoked
  1134	 *	error		The hardware-defined error code
  1135	 *	regs		The exception frame at time of fault/breakpoint.
  1136	 *	db_result	Result code from the break or debug point.
  1137	 * Returns:
  1138	 *	0	KDB was invoked for an event which it wasn't responsible
  1139	 *	1	KDB handled the event for which it was invoked.
  1140	 *	KDB_CMD_GO	User typed 'go'.
  1141	 *	KDB_CMD_CPU	User switched to another cpu.
  1142	 *	KDB_CMD_SS	Single step.
  1143	 */
  1144	static int kdb_local(kdb_reason_t reason, int error, struct pt_regs *regs,
  1145			     kdb_dbtrap_t db_result)
  1146	{
  1147		char *cmdbuf;
  1148		int diag;
  1149		struct task_struct *kdb_current =
  1150			curr_task(raw_smp_processor_id());
  1151	
  1152		KDB_DEBUG_STATE("kdb_local 1", reason);
  1153	
  1154		kdb_check_for_lockdown();
  1155	
  1156		kdb_go_count = 0;
  1157		if (reason == KDB_REASON_DEBUG) {
  1158			/* special case below */
  1159		} else {
  1160			kdb_printf("\nEntering kdb (current=0x%px, pid %d) ",
  1161				   kdb_current, kdb_current ? kdb_current->pid : 0);
  1162	#if defined(CONFIG_SMP)
  1163			kdb_printf("on processor %d ", raw_smp_processor_id());
  1164	#endif
  1165		}
  1166	
  1167		switch (reason) {
  1168		case KDB_REASON_DEBUG:
  1169		{
  1170			/*
  1171			 * If re-entering kdb after a single step
  1172			 * command, don't print the message.
  1173			 */
  1174			switch (db_result) {
  1175			case KDB_DB_BPT:
  1176				kdb_printf("\nEntering kdb (0x%px, pid %d) ",
  1177					   kdb_current, kdb_current->pid);
  1178	#if defined(CONFIG_SMP)
  1179				kdb_printf("on processor %d ", raw_smp_processor_id());
  1180	#endif
  1181				kdb_printf("due to Debug @ " kdb_machreg_fmt "\n",
  1182					   instruction_pointer(regs));
  1183				break;
  1184			case KDB_DB_SS:
  1185				break;
  1186			case KDB_DB_SSBPT:
  1187				KDB_DEBUG_STATE("kdb_local 4", reason);
  1188				return 1;	/* kdba_db_trap did the work */
  1189			default:
  1190				kdb_printf("kdb: Bad result from kdba_db_trap: %d\n",
  1191					   db_result);
  1192				break;
  1193			}
  1194	
  1195		}
  1196			break;
  1197		case KDB_REASON_ENTER:
  1198			if (KDB_STATE(KEYBOARD))
  1199				kdb_printf("due to Keyboard Entry\n");
  1200			else
  1201				kdb_printf("due to KDB_ENTER()\n");
  1202			break;
  1203		case KDB_REASON_KEYBOARD:
  1204			KDB_STATE_SET(KEYBOARD);
  1205			kdb_printf("due to Keyboard Entry\n");
  1206			break;
  1207		case KDB_REASON_ENTER_SLAVE:
  1208			/* drop through, slaves only get released via cpu switch */
  1209		case KDB_REASON_SWITCH:
  1210			kdb_printf("due to cpu switch\n");
  1211			break;
  1212		case KDB_REASON_OOPS:
  1213			kdb_printf("Oops: %s\n", kdb_diemsg);
  1214			kdb_printf("due to oops @ " kdb_machreg_fmt "\n",
  1215				   instruction_pointer(regs));
  1216			kdb_dumpregs(regs);
  1217			break;
  1218		case KDB_REASON_SYSTEM_NMI:
  1219			kdb_printf("due to System NonMaskable Interrupt\n");
  1220			break;
  1221		case KDB_REASON_NMI:
  1222			kdb_printf("due to NonMaskable Interrupt @ "
  1223				   kdb_machreg_fmt "\n",
  1224				   instruction_pointer(regs));
  1225			break;
  1226		case KDB_REASON_SSTEP:
  1227		case KDB_REASON_BREAK:
  1228			kdb_printf("due to %s @ " kdb_machreg_fmt "\n",
  1229				   reason == KDB_REASON_BREAK ?
  1230				   "Breakpoint" : "SS trap", instruction_pointer(regs));
  1231			/*
  1232			 * Determine if this breakpoint is one that we
  1233			 * are interested in.
  1234			 */
  1235			if (db_result != KDB_DB_BPT) {
  1236				kdb_printf("kdb: error return from kdba_bp_trap: %d\n",
  1237					   db_result);
  1238				KDB_DEBUG_STATE("kdb_local 6", reason);
  1239				return 0;	/* Not for us, dismiss it */
  1240			}
  1241			break;
  1242		case KDB_REASON_RECURSE:
  1243			kdb_printf("due to Recursion @ " kdb_machreg_fmt "\n",
  1244				   instruction_pointer(regs));
  1245			break;
  1246		default:
  1247			kdb_printf("kdb: unexpected reason code: %d\n", reason);
  1248			KDB_DEBUG_STATE("kdb_local 8", reason);
  1249			return 0;	/* Not for us, dismiss it */
  1250		}
  1251	
  1252		while (1) {
  1253			/*
  1254			 * Initialize pager context.
  1255			 */
  1256			kdb_nextline = 1;
  1257			KDB_STATE_CLEAR(SUPPRESS);
  1258			kdb_grepping_flag = 0;
  1259			/* ensure the old search does not leak into '/' commands */
  1260			kdb_grep_string[0] = '\0';
  1261	
  1262			cmdbuf = cmd_cur;
  1263			*cmdbuf = '\0';
  1264			*(cmd_hist[cmd_head]) = '\0';
  1265	
  1266	do_full_getstr:
  1267			/* PROMPT can only be set if we have MEM_READ permission. */
> 1268			snprintf(kdb_prompt_str, sizeof(kdb_prompt_str),
  1269				 kdbgetenv("PROMPT"), raw_smp_processor_id());
  1270	
  1271			/*
  1272			 * Fetch command from keyboard
  1273			 */
  1274			cmdbuf = kdb_getstr(cmdbuf, CMD_BUFLEN, kdb_prompt_str);
  1275			if (*cmdbuf != '\n') {
  1276				if (*cmdbuf < 32) {
  1277					if (cmdptr == cmd_head) {
  1278						strscpy(cmd_hist[cmd_head], cmd_cur,
  1279							CMD_BUFLEN);
  1280						*(cmd_hist[cmd_head] +
  1281						  strlen(cmd_hist[cmd_head])-1) = '\0';
  1282					}
  1283					if (!handle_ctrl_cmd(cmdbuf))
  1284						*(cmd_cur+strlen(cmd_cur)-1) = '\0';
  1285					cmdbuf = cmd_cur;
  1286					goto do_full_getstr;
  1287				} else {
  1288					strscpy(cmd_hist[cmd_head], cmd_cur,
  1289						CMD_BUFLEN);
  1290				}
  1291	
  1292				cmd_head = (cmd_head+1) % KDB_CMD_HISTORY_COUNT;
  1293				if (cmd_head == cmd_tail)
  1294					cmd_tail = (cmd_tail+1) % KDB_CMD_HISTORY_COUNT;
  1295			}
  1296	
  1297			cmdptr = cmd_head;
  1298			diag = kdb_parse(cmdbuf);
  1299			if (diag == KDB_NOTFOUND) {
  1300				drop_newline(cmdbuf);
  1301				kdb_printf("Unknown kdb command: '%s'\n", cmdbuf);
  1302				diag = 0;
  1303			}
  1304			if (diag == KDB_CMD_GO
  1305			 || diag == KDB_CMD_CPU
  1306			 || diag == KDB_CMD_SS
  1307			 || diag == KDB_CMD_KGDB)
  1308				break;
  1309	
  1310			if (diag)
  1311				kdb_cmderror(diag);
  1312		}
  1313		KDB_DEBUG_STATE("kdb_local 9", diag);
  1314		return diag;
  1315	}
  1316	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
