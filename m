Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAEA81F;
	Sun,  7 Apr 2024 00:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712449979; cv=none; b=s1hYgxOjqpggRxcLsdWQEq7ZScIzFti9Y9GVyPtZbhnBlVu9vEIP4q0Oe11HWeqriChldKX1SLpOF7ozR2NRs/hgvJfM8vUhSso1LwYkBRbWiO/cK2WIh14YFre/F6T1rBMvrySAosJmzIts2P9zzGcivS7962NN2nRCQWvwsXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712449979; c=relaxed/simple;
	bh=l7bnlOPMabbtDst3gLC3T1HyOuhLpopT7eClWwPAerw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nwMBQc9k3rfKxmoAu5lxfGBGcGx4wvjWXM8HP81XUbEhc3TEMJ57wPWhAyLuTY28mhOzoGnx7Bnx9zyW3k8Hh85gXeBsVhFnaIx7H5UgQsKr1oEle/4de65ZOMxz+NdGIHvdJhHn6KtLIUMcdEzEsT2QUhWLHS5WY1LSstoSbwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j5qhy7DK; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j5qhy7DK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712449977; x=1743985977;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l7bnlOPMabbtDst3gLC3T1HyOuhLpopT7eClWwPAerw=;
  b=j5qhy7DKIf5DfNYcWN8p00l2AJc0lQ5vZswx1gqB7BHjvURKiYeer8Pb
   PGoTUZmJel81FC5WeBDK8vNRBY6lT1RG7Mm2AebX4LwwaXRP5L2icsadx
   7Ppns2EMPkfb2XWU65RyR37N42/44XdSmrwYonjmC97KBw96lcqvaRn8a
   Xx2JiFommMeJ+wpjNdy7twn0Lsn54nSraXdSbLXrEaOq5Qs4Hc2xc4Tpn
   pIA1Jf4i2xwlGXygA1byf4HZsXwGBcFcosFLKdYL1dCUXg78XSH0IHQ8v
   ppsSRZ/i2FhpwNOicn7/KH20TGrHsL1Irh5f8p7AuylwdqBsc6IXiTYDb
   w==;
X-CSE-ConnectionGUID: kiv8lzI6SiKXuSXlDFHZ4g==
X-CSE-MsgGUID: XU3c0gCGQNKaNzAMzWci5Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11036"; a="10722165"
X-IronPort-AV: E=Sophos;i="6.07,184,1708416000"; 
   d="scan'208";a="10722165"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2024 17:32:56 -0700
X-CSE-ConnectionGUID: JDoR4zkXTquqfBJSyUissQ==
X-CSE-MsgGUID: aTaAfzV/RsqmaCaLMxHVWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,184,1708416000"; 
   d="scan'208";a="19950556"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 Apr 2024 17:32:54 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtGSq-00041M-09;
	Sun, 07 Apr 2024 00:32:52 +0000
Date: Sun, 7 Apr 2024 08:32:17 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 131/133] drivers/thunderbolt/debugfs.c:1295:1:
 error: use of undeclared identifier 'port_regs_write_iter'; did you mean
 'counters_write_iter'?
Message-ID: <202404070836.FlNpiXta-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   1a95bcd36c1c2fd1c92f33b5ea95c2e0a5667100
commit: 89411a4bdffd8ff2be46aa676ae8c33a64e8d3d0 [131/133] drivers/thunderbolt: convert to read/write iterators
config: i386-buildonly-randconfig-006-20240407 (https://download.01.org/0day-ci/archive/20240407/202404070836.FlNpiXta-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240407/202404070836.FlNpiXta-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404070836.FlNpiXta-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/thunderbolt/debugfs.c:1295:1: error: use of undeclared identifier 'port_regs_write_iter'; did you mean 'counters_write_iter'?
    1295 | DEBUGFS_ATTR_RW(port_regs);
         | ^
   drivers/thunderbolt/debugfs.c:55:24: note: expanded from macro 'DEBUGFS_ATTR_RW'
      55 |         DEBUGFS_ATTR(__space, __space ## _write ## _iter)
         |                               ^
   <scratch space>:189:1: note: expanded from here
     189 | port_regs_write_iter
         | ^
   drivers/thunderbolt/debugfs.c:1100:1: note: 'counters_write_iter' declared here
    1100 | FOPS_WRITE_ITER_HELPER(counters_write);
         | ^
   include/linux/fs.h:2157:16: note: expanded from macro 'FOPS_WRITE_ITER_HELPER'
    2157 | static ssize_t name## _iter(struct kiocb *iocb, struct iov_iter *from)  \
         |                ^
   <scratch space>:173:1: note: expanded from here
     173 | counters_write_iter
         | ^
>> drivers/thunderbolt/debugfs.c:1399:1: error: use of undeclared identifier 'switch_regs_write_iter'
    1399 | DEBUGFS_ATTR_RW(switch_regs);
         | ^
   drivers/thunderbolt/debugfs.c:55:24: note: expanded from macro 'DEBUGFS_ATTR_RW'
      55 |         DEBUGFS_ATTR(__space, __space ## _write ## _iter)
         |                               ^
   <scratch space>:195:1: note: expanded from here
     195 | switch_regs_write_iter
         | ^
   2 errors generated.


vim +1295 drivers/thunderbolt/debugfs.c

54e418106c765c Gil Fine 2020-06-29  1264  
54e418106c765c Gil Fine 2020-06-29  1265  static int port_regs_show(struct seq_file *s, void *not_used)
54e418106c765c Gil Fine 2020-06-29  1266  {
54e418106c765c Gil Fine 2020-06-29  1267  	struct tb_port *port = s->private;
54e418106c765c Gil Fine 2020-06-29  1268  	struct tb_switch *sw = port->sw;
54e418106c765c Gil Fine 2020-06-29  1269  	struct tb *tb = sw->tb;
54e418106c765c Gil Fine 2020-06-29  1270  	int ret;
54e418106c765c Gil Fine 2020-06-29  1271  
54e418106c765c Gil Fine 2020-06-29  1272  	pm_runtime_get_sync(&sw->dev);
54e418106c765c Gil Fine 2020-06-29  1273  
54e418106c765c Gil Fine 2020-06-29  1274  	if (mutex_lock_interruptible(&tb->lock)) {
54e418106c765c Gil Fine 2020-06-29  1275  		ret = -ERESTARTSYS;
54e418106c765c Gil Fine 2020-06-29  1276  		goto out_rpm_put;
54e418106c765c Gil Fine 2020-06-29  1277  	}
54e418106c765c Gil Fine 2020-06-29  1278  
54e418106c765c Gil Fine 2020-06-29  1279  	seq_puts(s, "# offset relative_offset cap_id vs_cap_id value\n");
54e418106c765c Gil Fine 2020-06-29  1280  
54e418106c765c Gil Fine 2020-06-29  1281  	ret = port_basic_regs_show(port, s);
54e418106c765c Gil Fine 2020-06-29  1282  	if (ret)
54e418106c765c Gil Fine 2020-06-29  1283  		goto out_unlock;
54e418106c765c Gil Fine 2020-06-29  1284  
54e418106c765c Gil Fine 2020-06-29  1285  	port_caps_show(port, s);
54e418106c765c Gil Fine 2020-06-29  1286  
54e418106c765c Gil Fine 2020-06-29  1287  out_unlock:
54e418106c765c Gil Fine 2020-06-29  1288  	mutex_unlock(&tb->lock);
54e418106c765c Gil Fine 2020-06-29  1289  out_rpm_put:
54e418106c765c Gil Fine 2020-06-29  1290  	pm_runtime_mark_last_busy(&sw->dev);
54e418106c765c Gil Fine 2020-06-29  1291  	pm_runtime_put_autosuspend(&sw->dev);
54e418106c765c Gil Fine 2020-06-29  1292  
54e418106c765c Gil Fine 2020-06-29  1293  	return ret;
54e418106c765c Gil Fine 2020-06-29  1294  }
54e418106c765c Gil Fine 2020-06-29 @1295  DEBUGFS_ATTR_RW(port_regs);
54e418106c765c Gil Fine 2020-06-29  1296  
54e418106c765c Gil Fine 2020-06-29  1297  static void switch_cap_show(struct tb_switch *sw, struct seq_file *s,
54e418106c765c Gil Fine 2020-06-29  1298  			    unsigned int cap)
54e418106c765c Gil Fine 2020-06-29  1299  {
54e418106c765c Gil Fine 2020-06-29  1300  	struct tb_cap_any header;
54e418106c765c Gil Fine 2020-06-29  1301  	int ret, length;
54e418106c765c Gil Fine 2020-06-29  1302  	u8 vsec_id = 0;
54e418106c765c Gil Fine 2020-06-29  1303  
54e418106c765c Gil Fine 2020-06-29  1304  	ret = tb_sw_read(sw, &header, TB_CFG_SWITCH, cap, 1);
54e418106c765c Gil Fine 2020-06-29  1305  	if (ret) {
54e418106c765c Gil Fine 2020-06-29  1306  		seq_printf(s, "0x%04x <capability read failed>\n", cap);
54e418106c765c Gil Fine 2020-06-29  1307  		return;
54e418106c765c Gil Fine 2020-06-29  1308  	}
54e418106c765c Gil Fine 2020-06-29  1309  
54e418106c765c Gil Fine 2020-06-29  1310  	if (header.basic.cap == TB_SWITCH_CAP_VSE) {
54e418106c765c Gil Fine 2020-06-29  1311  		if (!header.extended_short.length) {
54e418106c765c Gil Fine 2020-06-29  1312  			ret = tb_sw_read(sw, (u32 *)&header + 1, TB_CFG_SWITCH,
54e418106c765c Gil Fine 2020-06-29  1313  					 cap + 1, 1);
54e418106c765c Gil Fine 2020-06-29  1314  			if (ret) {
54e418106c765c Gil Fine 2020-06-29  1315  				seq_printf(s, "0x%04x <capability read failed>\n",
54e418106c765c Gil Fine 2020-06-29  1316  					   cap + 1);
54e418106c765c Gil Fine 2020-06-29  1317  				return;
54e418106c765c Gil Fine 2020-06-29  1318  			}
54e418106c765c Gil Fine 2020-06-29  1319  			length = header.extended_long.length;
54e418106c765c Gil Fine 2020-06-29  1320  		} else {
54e418106c765c Gil Fine 2020-06-29  1321  			length = header.extended_short.length;
54e418106c765c Gil Fine 2020-06-29  1322  		}
54e418106c765c Gil Fine 2020-06-29  1323  		vsec_id = header.extended_short.vsec_id;
54e418106c765c Gil Fine 2020-06-29  1324  	} else {
54e418106c765c Gil Fine 2020-06-29  1325  		if (header.basic.cap == TB_SWITCH_CAP_TMU) {
54e418106c765c Gil Fine 2020-06-29  1326  			length = SWITCH_CAP_TMU_LEN;
54e418106c765c Gil Fine 2020-06-29  1327  		} else  {
54e418106c765c Gil Fine 2020-06-29  1328  			seq_printf(s, "0x%04x <unknown capability 0x%02x>\n",
54e418106c765c Gil Fine 2020-06-29  1329  				   cap, header.basic.cap);
54e418106c765c Gil Fine 2020-06-29  1330  			return;
54e418106c765c Gil Fine 2020-06-29  1331  		}
54e418106c765c Gil Fine 2020-06-29  1332  	}
54e418106c765c Gil Fine 2020-06-29  1333  
54e418106c765c Gil Fine 2020-06-29  1334  	cap_show(s, sw, NULL, cap, header.basic.cap, vsec_id, length);
54e418106c765c Gil Fine 2020-06-29  1335  }
54e418106c765c Gil Fine 2020-06-29  1336  
54e418106c765c Gil Fine 2020-06-29  1337  static void switch_caps_show(struct tb_switch *sw, struct seq_file *s)
54e418106c765c Gil Fine 2020-06-29  1338  {
54e418106c765c Gil Fine 2020-06-29  1339  	int cap;
54e418106c765c Gil Fine 2020-06-29  1340  
54e418106c765c Gil Fine 2020-06-29  1341  	cap = tb_switch_next_cap(sw, 0);
54e418106c765c Gil Fine 2020-06-29  1342  	while (cap > 0) {
54e418106c765c Gil Fine 2020-06-29  1343  		switch_cap_show(sw, s, cap);
54e418106c765c Gil Fine 2020-06-29  1344  		cap = tb_switch_next_cap(sw, cap);
54e418106c765c Gil Fine 2020-06-29  1345  	}
54e418106c765c Gil Fine 2020-06-29  1346  }
54e418106c765c Gil Fine 2020-06-29  1347  
54e418106c765c Gil Fine 2020-06-29  1348  static int switch_basic_regs_show(struct tb_switch *sw, struct seq_file *s)
54e418106c765c Gil Fine 2020-06-29  1349  {
54e418106c765c Gil Fine 2020-06-29  1350  	u32 data[SWITCH_CAP_BASIC_LEN];
54e418106c765c Gil Fine 2020-06-29  1351  	size_t dwords;
54e418106c765c Gil Fine 2020-06-29  1352  	int ret, i;
54e418106c765c Gil Fine 2020-06-29  1353  
54e418106c765c Gil Fine 2020-06-29  1354  	/* Only USB4 has the additional registers */
54e418106c765c Gil Fine 2020-06-29  1355  	if (tb_switch_is_usb4(sw))
54e418106c765c Gil Fine 2020-06-29  1356  		dwords = ARRAY_SIZE(data);
54e418106c765c Gil Fine 2020-06-29  1357  	else
54e418106c765c Gil Fine 2020-06-29  1358  		dwords = 7;
54e418106c765c Gil Fine 2020-06-29  1359  
54e418106c765c Gil Fine 2020-06-29  1360  	ret = tb_sw_read(sw, data, TB_CFG_SWITCH, 0, dwords);
54e418106c765c Gil Fine 2020-06-29  1361  	if (ret)
54e418106c765c Gil Fine 2020-06-29  1362  		return ret;
54e418106c765c Gil Fine 2020-06-29  1363  
54e418106c765c Gil Fine 2020-06-29  1364  	for (i = 0; i < dwords; i++)
54e418106c765c Gil Fine 2020-06-29  1365  		seq_printf(s, "0x%04x %4d 0x00 0x00 0x%08x\n", i, i, data[i]);
54e418106c765c Gil Fine 2020-06-29  1366  
54e418106c765c Gil Fine 2020-06-29  1367  	return 0;
54e418106c765c Gil Fine 2020-06-29  1368  }
54e418106c765c Gil Fine 2020-06-29  1369  
54e418106c765c Gil Fine 2020-06-29  1370  static int switch_regs_show(struct seq_file *s, void *not_used)
54e418106c765c Gil Fine 2020-06-29  1371  {
54e418106c765c Gil Fine 2020-06-29  1372  	struct tb_switch *sw = s->private;
54e418106c765c Gil Fine 2020-06-29  1373  	struct tb *tb = sw->tb;
54e418106c765c Gil Fine 2020-06-29  1374  	int ret;
54e418106c765c Gil Fine 2020-06-29  1375  
54e418106c765c Gil Fine 2020-06-29  1376  	pm_runtime_get_sync(&sw->dev);
54e418106c765c Gil Fine 2020-06-29  1377  
54e418106c765c Gil Fine 2020-06-29  1378  	if (mutex_lock_interruptible(&tb->lock)) {
54e418106c765c Gil Fine 2020-06-29  1379  		ret = -ERESTARTSYS;
54e418106c765c Gil Fine 2020-06-29  1380  		goto out_rpm_put;
54e418106c765c Gil Fine 2020-06-29  1381  	}
54e418106c765c Gil Fine 2020-06-29  1382  
54e418106c765c Gil Fine 2020-06-29  1383  	seq_puts(s, "# offset relative_offset cap_id vs_cap_id value\n");
54e418106c765c Gil Fine 2020-06-29  1384  
54e418106c765c Gil Fine 2020-06-29  1385  	ret = switch_basic_regs_show(sw, s);
54e418106c765c Gil Fine 2020-06-29  1386  	if (ret)
54e418106c765c Gil Fine 2020-06-29  1387  		goto out_unlock;
54e418106c765c Gil Fine 2020-06-29  1388  
54e418106c765c Gil Fine 2020-06-29  1389  	switch_caps_show(sw, s);
54e418106c765c Gil Fine 2020-06-29  1390  
54e418106c765c Gil Fine 2020-06-29  1391  out_unlock:
54e418106c765c Gil Fine 2020-06-29  1392  	mutex_unlock(&tb->lock);
54e418106c765c Gil Fine 2020-06-29  1393  out_rpm_put:
54e418106c765c Gil Fine 2020-06-29  1394  	pm_runtime_mark_last_busy(&sw->dev);
54e418106c765c Gil Fine 2020-06-29  1395  	pm_runtime_put_autosuspend(&sw->dev);
54e418106c765c Gil Fine 2020-06-29  1396  
54e418106c765c Gil Fine 2020-06-29  1397  	return ret;
54e418106c765c Gil Fine 2020-06-29  1398  }
54e418106c765c Gil Fine 2020-06-29 @1399  DEBUGFS_ATTR_RW(switch_regs);
54e418106c765c Gil Fine 2020-06-29  1400  

:::::: The code at line 1295 was first introduced by commit
:::::: 54e418106c765c5f3c378c770b0f8518632830da thunderbolt: Add debugfs interface

:::::: TO: Gil Fine <gil.fine@intel.com>
:::::: CC: Mika Westerberg <mika.westerberg@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
