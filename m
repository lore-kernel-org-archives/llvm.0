Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271B7221FCA;
	Wed, 14 Jan 2026 03:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768361532; cv=none; b=uincSAigAYO2W52ZNNEtWAL1gW3zvKw79EQtQX/KkBzRbLj7UdECOBf5cstvBD7qPkTZ7ReI0GemVir2+QnYOcDy3TpuqIx5h47bSXYDpSb0FIQk1J8dm4m3Nf+0OB194R8n3fHq9viX/YLQvDGkfzwQ0CAxZsRg+y+9T3hI+34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768361532; c=relaxed/simple;
	bh=DgAhAdepUnjp+k3Df0WJMhod73fO0hqcJptvi1pvuuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JWEeLgsuC2tHyNjD8yRFYDFHdAB42XolMVRzUSv7GIX3H0eWU2Hlxvnnv10vHKIv2YPS9fw1oJ6nz+TBTOZG93LFb4CMtIprNeHbe7actHXTA3R6EZMPemdPwcYVo1q81CvD6OihtxAZlfndilUwlqmHjodkS3arBtBEHSvZWc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KwbYgqvX; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KwbYgqvX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768361530; x=1799897530;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DgAhAdepUnjp+k3Df0WJMhod73fO0hqcJptvi1pvuuA=;
  b=KwbYgqvXv/A8gB8Xy+AtdJ296bAE+l9Fpo9kSuvRbwa+IAonguDm1hBi
   wQzMWFq3iFzgdRj9hyoLa0uoZeAae/QmNj/YkvPtlx5qvYqBqhOxOEZrh
   Rao8Dr615zMTC0sdlzxmxQBrEMieSRJsbaw7qnSc19lCB2pwRiWFJuBFk
   DbrF5bBylcHIoCh7hkWdOuWYc5zEQnjWBlM/mXU64o6I70XJTsfVFP51D
   JG+ZYfTSjBAIcGiPkGXB0+IpuWKJqnJTH5/36fblVeVKGWPrXIlmKeQ3q
   4B2HhDcitrPBAOzI/DJKTbBaQNFVxVN5xuMPW5IDhsye4ArOsQbUCgT5D
   A==;
X-CSE-ConnectionGUID: uM38BmdkTcWBJTOACtuU4w==
X-CSE-MsgGUID: 0vD/5fYZQeWTcZYygZ24PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="80306365"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="80306365"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 19:32:09 -0800
X-CSE-ConnectionGUID: lbfhpFDURfK7rW8hPfkrng==
X-CSE-MsgGUID: r0fEaz18RpyK09lrk5Ovlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="235281436"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Jan 2026 19:32:07 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfrc3-00000000FjQ-35Uq;
	Wed, 14 Jan 2026 03:32:03 +0000
Date: Wed, 14 Jan 2026 11:31:58 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>, netdev@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dhowells@redhat.com,
	syzbot+6182afad5045e6703b3d@syzkaller.appspotmail.com,
	Marc Dionne <marc.dionne@auristor.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, linux-afs@lists.infradead.org,
	stable@kernel.org, linux-kernel@kernel.org
Subject: Re: [PATCH] rxrpc: Fix data-race warning and potential load/store
 tearing
Message-ID: <202601141152.2TfkKMKv-lkp@intel.com>
References: <3535584.1768322992@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3535584.1768322992@warthog.procyon.org.uk>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net/main]
[also build test WARNING on net-next/main linus/master v6.19-rc5 next-20260113]
[cannot apply to horms-ipvs/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Howells/rxrpc-Fix-data-race-warning-and-potential-load-store-tearing/20260114-005726
base:   net/main
patch link:    https://lore.kernel.org/r/3535584.1768322992%40warthog.procyon.org.uk
patch subject: [PATCH] rxrpc: Fix data-race warning and potential load/store tearing
config: x86_64-buildonly-randconfig-006-20260114 (https://download.01.org/0day-ci/archive/20260114/202601141152.2TfkKMKv-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601141152.2TfkKMKv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601141152.2TfkKMKv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/rxrpc/proc.c:305:6: warning: format specifies type 'unsigned long long' but the argument has type 's32' (aka 'int') [-Wformat]
     299 |                    "UDP   %-47.47s %-47.47s %3u %4u %5u %6llus %8d %8d\n",
         |                                                         ~~~~~
         |                                                         %6d
     300 |                    lbuff,
     301 |                    rbuff,
     302 |                    refcount_read(&peer->ref),
     303 |                    peer->cong_ssthresh,
     304 |                    peer->max_data,
     305 |                    (s32)now - (s32)peer->last_tx_at,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +305 net/rxrpc/proc.c

   274	
   275	/*
   276	 * generate a list of extant virtual peers in /proc/net/rxrpc/peers
   277	 */
   278	static int rxrpc_peer_seq_show(struct seq_file *seq, void *v)
   279	{
   280		struct rxrpc_peer *peer;
   281		time64_t now;
   282		char lbuff[50], rbuff[50];
   283	
   284		if (v == SEQ_START_TOKEN) {
   285			seq_puts(seq,
   286				 "Proto Local                                           Remote                                          Use SST   Maxd LastUse      RTT      RTO\n"
   287				 );
   288			return 0;
   289		}
   290	
   291		peer = list_entry(v, struct rxrpc_peer, hash_link);
   292	
   293		sprintf(lbuff, "%pISpc", &peer->local->srx.transport);
   294	
   295		sprintf(rbuff, "%pISpc", &peer->srx.transport);
   296	
   297		now = ktime_get_seconds();
   298		seq_printf(seq,
   299			   "UDP   %-47.47s %-47.47s %3u %4u %5u %6llus %8d %8d\n",
   300			   lbuff,
   301			   rbuff,
   302			   refcount_read(&peer->ref),
   303			   peer->cong_ssthresh,
   304			   peer->max_data,
 > 305			   (s32)now - (s32)peer->last_tx_at,
   306			   READ_ONCE(peer->recent_srtt_us),
   307			   READ_ONCE(peer->recent_rto_us));
   308	
   309		return 0;
   310	}
   311	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
