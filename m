Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F46337F736;
	Thu, 26 Mar 2026 19:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774552440; cv=none; b=JzLQearXT95T13SLEMY5iXWhO8YKPX3NNPBMdxRreCVBiDt9TsarfyT5KNsc80BI233ZH9NH4rWOz75mWSSPbFLCz3AW5hWNpzxNtxUTGfkCxyMkBwUVQStNjU4zedlLhWtHhBTuZUNKNwjPt1VXzio8Oqd2ESSKfig6VJ8zL9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774552440; c=relaxed/simple;
	bh=tltjxf8jFcPq7OEubyq8By6LslzVEqdhOSnFAcg5Ie4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zj4aoz0QuB3aczy1VSMoFMQ6Njv9LyyH8JM6qKrkGGn6kFa3aNBSa1ictNPYNEq32SU2x35dh0QEW9nqf4VHUsuxL3e68uEqGimD+AYzJIvdoKxXELQRm66Dwtisez17002p4b6U1DUFVzQhK39lMjA8dXZuj+eyJriKY+7Npsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CWqKwkgW; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CWqKwkgW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774552439; x=1806088439;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tltjxf8jFcPq7OEubyq8By6LslzVEqdhOSnFAcg5Ie4=;
  b=CWqKwkgWezV/0YJ0ONZvjKb9xHyifl9DWfFi/657WpGo7cWbg0UWsp/u
   ZRz4gS5LYbhijQQYgisX5idHqIMKX9QJ9PCOu4E+85bOTlq8FPztNqflX
   YwKxn7Aphzzh81nyKk+CHAAe6QO9yngtbNg5yQW/fD3VuMpWhGDmN5oH1
   PICJGaubJnrVRrTvlODid1q/F0ZCbQ3Wc4wF7HRS0MUEkvX2GP05vyVBy
   jMdk/Q6BTYxp1m98cZmFqe+IjRPRyK9+z+D0pP57WdpSLbYVpG57m85DQ
   De8OPeHP3qBbHX/Zu2WyedtxGKhkoaYPiJMCfZ3X5yR0kYPiaoSaAXFRJ
   g==;
X-CSE-ConnectionGUID: I0xzm4RBQ3aZpB7uzjAzSg==
X-CSE-MsgGUID: ZuZatRzVSWmzlI4NByacdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="63181177"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="63181177"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 12:13:59 -0700
X-CSE-ConnectionGUID: weliWc2oSCaLWztwRBeIEg==
X-CSE-MsgGUID: bRjTQAYVTpiEQpSUIRbmlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="222183335"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 26 Mar 2026 12:13:56 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5q9R-000000009FV-2Up5;
	Thu, 26 Mar 2026 19:13:53 +0000
Date: Fri, 27 Mar 2026 03:13:25 +0800
From: kernel test robot <lkp@intel.com>
To: Kuniyuki Iwashima <kuniyu@google.com>,
	Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>, linux-block@vger.kernel.org,
	nbd@other.debian.org, netdev@vger.kernel.org,
	syzbot+7b4f368d3955d2c9950e@syzkaller.appspotmail.com
Subject: Re: [PATCH 5/5] nbd: Use lock_sock_try() for TCP sendmsg() and
 shutdown().
Message-ID: <202603270301.kJulQgkT-lkp@intel.com>
References: <20260325063843.1790782-6-kuniyu@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325063843.1790782-6-kuniyu@google.com>

Hi Kuniyuki,

kernel test robot noticed the following build errors:

[auto build test ERROR on axboe/for-next]
[also build test ERROR on linus/master v7.0-rc5]
[cannot apply to next-20260325]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuniyuki-Iwashima/nbd-Remove-redundant-sock-ops-shutdown-check-in-nbd_get_socket/20260325-175457
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-next
patch link:    https://lore.kernel.org/r/20260325063843.1790782-6-kuniyu%40google.com
patch subject: [PATCH 5/5] nbd: Use lock_sock_try() for TCP sendmsg() and shutdown().
config: x86_64-buildonly-randconfig-004-20260326 (https://download.01.org/0day-ci/archive/20260327/202603270301.kJulQgkT-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603270301.kJulQgkT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603270301.kJulQgkT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: inet_shutdown_locked
   >>> referenced by nbd.c
   >>>               drivers/block/nbd.o:(nbd_mark_nsock_dead) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: tcp_sendmsg_locked
   >>> referenced by nbd.c
   >>>               drivers/block/nbd.o:(__sock_xmit) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
