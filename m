Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02A83C4B88;
	Tue, 23 Jun 2026 07:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782199803; cv=none; b=ZI2FPdP3UMx0ZIuCk7qU5HM9TZmF+/6g3MjBE9ajqhOVt+V8NA5OeET3z3iKmQVSgVBi7uPvZvzDLg4s+orUNZCPYlSQnesgFNfhIIR0DSGQqX/aQQitrMp+x833sI+QFJtHuRBoclkGc0qsD0lnm8sjd/2ixP8iq1PfQwdxs1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782199803; c=relaxed/simple;
	bh=I3r/U9PrEygY6tUe6IwAu6tY5K41z/4WwI9BscltyZk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=plAkB00JS1DPO9nvwrkKQ6WSa+aMNArRmVxr85S5WIG3fIkkdAeSIlP+QiiziGF8Cmt8sNMcVIDXA9b8JWq0KnwAELH2LDE91rh2VEo+bBcXMhl/rP0UGdAzSJ6ZLuJNJXn/gvPYmG4ZW5bZ576c6sLq2G2EcSBd+RFe/G3jq6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QARPPWpA; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QARPPWpA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782199801; x=1813735801;
  h=date:from:to:cc:subject:message-id;
  bh=I3r/U9PrEygY6tUe6IwAu6tY5K41z/4WwI9BscltyZk=;
  b=QARPPWpAymfdD3uZNdVgNF5LZJb1CqugqrDR/2orNoCKDY+l6APmCO6e
   IS8sbrfV9l/rh83YicLK/ZjfRz8Le6nEro2bVoinT8DYpN/VclMwI8WrK
   8yU9yTCc33Dw5tI8TdodkiQx5RILE2eV8R7J8U+EjbqLzmKcfec6BSqJs
   P9fEhzn+ehpeYdKXZseBJXStTXuJlsCRZE9SlwIEZ+PkkOM7pwEAKH7oE
   sxnxrUa5Ui+DWl2os20oGAjbgT4r1z24oajZMKfXVc5ObehIhChLO9K2b
   vwv9HX3YgmWUW9Y/eBz/3UuV7IDNgSs6ZOrMjCn3o6ZAZm6XiUrLnEW9c
   Q==;
X-CSE-ConnectionGUID: hE/uakR4RMK03aMvtmX4fA==
X-CSE-MsgGUID: wBe6C6AVQiWNCTHvoQ04LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="81914970"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="81914970"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 00:30:00 -0700
X-CSE-ConnectionGUID: pBX1f44jQvC0nr+7beTD4A==
X-CSE-MsgGUID: wNrJGzt9TRmTQCGKrUytig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="273136001"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 23 Jun 2026 00:29:59 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbva1-000000006An-0SVp;
	Tue, 23 Jun 2026 07:29:57 +0000
Date: Tue, 23 Jun 2026 09:29:36 +0200
From: kernel test robot <lkp@intel.com>
To: Kaitao Cheng <chengkaitao@kylinos.cn>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: kernel/trace/trace_dynevent.c:74:26: warning: unused
 variable 'n'
Message-ID: <202606230910.yBz1zuqs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Kaitao,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/intel-lab-lkp/linux/commits/Kaitao-Cheng/list-Add-mutable-iterator-variants/20260622-193620
head:   72faf2855f60a21ac98d3e63d13a20dc1db9d8a1
commit: cfc71294af2e1960947edf634eb419e168ec0c77 kernel: Use mutable list iterators
date:   20 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260623/202606230910.yBz1zuqs-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606230910.yBz1zuqs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606230910.yBz1zuqs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/trace_dynevent.c:74:26: warning: unused variable 'n' [-Wunused-variable]
      74 |         struct dyn_event *pos, *n;
         |                                 ^
   1 warning generated.


vim +/n +74 kernel/trace/trace_dynevent.c

5448d44c38557f Masami Hiramatsu        2018-11-05   71  
d262271d04830e Masami Hiramatsu        2021-02-01   72  int dyn_event_release(const char *raw_command, struct dyn_event_operations *type)
5448d44c38557f Masami Hiramatsu        2018-11-05   73  {
5448d44c38557f Masami Hiramatsu        2018-11-05  @74  	struct dyn_event *pos, *n;
5448d44c38557f Masami Hiramatsu        2018-11-05   75  	char *system = NULL, *event, *p;
d262271d04830e Masami Hiramatsu        2021-02-01   76  	int argc, ret = -ENOENT;
9e49ca756d207f Steven Rostedt          2024-12-20   77  	char **argv __free(argv_free) = argv_split(GFP_KERNEL, raw_command, &argc);
d262271d04830e Masami Hiramatsu        2021-02-01   78  
d262271d04830e Masami Hiramatsu        2021-02-01   79  	if (!argv)
d262271d04830e Masami Hiramatsu        2021-02-01   80  		return -ENOMEM;
5448d44c38557f Masami Hiramatsu        2018-11-05   81  
1ce25e9f6fff76 Masami Hiramatsu        2018-11-05   82  	if (argv[0][0] == '-') {
9e49ca756d207f Steven Rostedt          2024-12-20   83  		if (argv[0][1] != ':')
9e49ca756d207f Steven Rostedt          2024-12-20   84  			return -EINVAL;
5448d44c38557f Masami Hiramatsu        2018-11-05   85  		event = &argv[0][2];
1ce25e9f6fff76 Masami Hiramatsu        2018-11-05   86  	} else {
1ce25e9f6fff76 Masami Hiramatsu        2018-11-05   87  		event = strchr(argv[0], ':');
9e49ca756d207f Steven Rostedt          2024-12-20   88  		if (!event)
9e49ca756d207f Steven Rostedt          2024-12-20   89  			return -EINVAL;
1ce25e9f6fff76 Masami Hiramatsu        2018-11-05   90  		event++;
1ce25e9f6fff76 Masami Hiramatsu        2018-11-05   91  	}
1ce25e9f6fff76 Masami Hiramatsu        2018-11-05   92  
5448d44c38557f Masami Hiramatsu        2018-11-05   93  	p = strchr(event, '/');
5448d44c38557f Masami Hiramatsu        2018-11-05   94  	if (p) {
5448d44c38557f Masami Hiramatsu        2018-11-05   95  		system = event;
5448d44c38557f Masami Hiramatsu        2018-11-05   96  		event = p + 1;
5448d44c38557f Masami Hiramatsu        2018-11-05   97  		*p = '\0';
5448d44c38557f Masami Hiramatsu        2018-11-05   98  	}
9e49ca756d207f Steven Rostedt          2024-12-20   99  	if (!system && event[0] == '\0')
9e49ca756d207f Steven Rostedt          2024-12-20  100  		return -EINVAL;
5448d44c38557f Masami Hiramatsu        2018-11-05  101  
5448d44c38557f Masami Hiramatsu        2018-11-05  102  	mutex_lock(&event_mutex);
cfc71294af2e19 Kaitao Cheng            2026-06-22  103  	for_each_dyn_event_safe(pos) {
5448d44c38557f Masami Hiramatsu        2018-11-05  104  		if (type && type != pos->ops)
5448d44c38557f Masami Hiramatsu        2018-11-05  105  			continue;
30199137c899d7 Masami Hiramatsu        2019-06-20  106  		if (!pos->ops->match(system, event,
d262271d04830e Masami Hiramatsu        2021-02-01  107  				argc - 1, (const char **)argv + 1, pos))
cb8e7a8d55e052 Masami Hiramatsu        2019-06-20  108  			continue;
cb8e7a8d55e052 Masami Hiramatsu        2019-06-20  109  
5448d44c38557f Masami Hiramatsu        2018-11-05  110  		ret = pos->ops->free(pos);
cb8e7a8d55e052 Masami Hiramatsu        2019-06-20  111  		if (ret)
5448d44c38557f Masami Hiramatsu        2018-11-05  112  			break;
5448d44c38557f Masami Hiramatsu        2018-11-05  113  	}
4313e5a613049d Steven Rostedt (Google  2022-11-23  114) 	tracing_reset_all_online_cpus();
5448d44c38557f Masami Hiramatsu        2018-11-05  115  	mutex_unlock(&event_mutex);
5448d44c38557f Masami Hiramatsu        2018-11-05  116  	return ret;
5448d44c38557f Masami Hiramatsu        2018-11-05  117  }
5448d44c38557f Masami Hiramatsu        2018-11-05  118  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
