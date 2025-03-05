Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4701FAC5C;
	Wed,  5 Mar 2025 09:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741165837; cv=none; b=cxDBdtd7Qi1A16OHqZ5RN6352VHfQRsu8xc+guYsccXE89yZB2iQ+HdTXW0I/yFk3GYi2zTfqWP2Mfn3bcbbftXwtq19cMh6r1Pmg8wwX6xBBNFmPNxMwirvHiep5Hvld3MmArzvIis8pR8FfQ6pK7+HEh50GPtBX10PkDqyIfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741165837; c=relaxed/simple;
	bh=EQtCo8tSKqyjMrR3Zfzl4on3sNXGuhfoyEbPQqh//RA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YEoogjXdC+UpKDGETxnF5BHHLW1vaLFJwYUy6xTJg3hAk+7k1sLCo1J91GZR+/Pp/RJNu+/dau1MWNCQT6zK2s80Rr68Ikz2GCTrepwBRHKCvmEZ2p77WUsnCEvKTMp+qpcXh67IIwfiHd9L4obmVq6kLDZfcBSPrilhG1L0BTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LOMJlFzM; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LOMJlFzM"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5dc89df7eccso10754286a12.3;
        Wed, 05 Mar 2025 01:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741165834; x=1741770634; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZhkzrvYS21LiP8zQmu1Wipl10MmV8PagJql4Vig2YQo=;
        b=LOMJlFzMQbk7/9fWJ5HDsFnkN11atYye1WzE24/o9ja8Ap8pkwsYr0wdq6vjDPC27i
         X06mfsIvGstjaG/+Ik5Kkh+ar5l09WAq4xobhiqbU7e8OVHTrsP1TfuIiA7Unuotgfji
         AFwUe7uNpKaE+PxAcCOGiyXriWBkoaie3/EUxHrGNtIu94+4QB4Xfr9GT2pdVLTBbFn7
         RB2DGSYE2cnet2d7g7xpdkuapKZa4GakBZKdPcqo93pMBSxiMXRoFcInSSL4Ljr8x9Dl
         PF6DiVeAgAz1zbjzA8AnfRxnXmG4sYEV5QUsBqS+al1mx3dI5geuZDEr4ejgqUzcWrP4
         sgtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741165834; x=1741770634;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZhkzrvYS21LiP8zQmu1Wipl10MmV8PagJql4Vig2YQo=;
        b=k6PFbYCQYRxX93qqm80o9yukQ3Lo4TexJVaG56SNqB762pjm17l+phsxJ9Q3n5CO5x
         7LJJDjFqGl8xOysENFHlpxZUsPSV+FebxZDDK8EIkomk19B0M0zudaMIVuxOUeTRdvyR
         73ML1GnDDKYAUn9cxn1gwg8ink3myPN2z1l4tuZi8Rnbs5louAwh4GhnqRTTIT0aHH2L
         jIzhU32D6a5Gs2V4u7jMXtcqQiU2/KunB/AWrfkN/qEj+wDeSwfnn1VQhp3b7qYywsG3
         DQJ+UsxPC9gugJbgaIunE/YNBwRp9yksnkbH24ti/r5u5lDN+w0cFjwoW4a6xTW7Z8vv
         XmtA==
X-Forwarded-Encrypted: i=1; AJvYcCVYgcmcZEHTRdFo8nXUPz1Bm7qX8ca8wz/EJQLZJHbZc5pavRm88UzAbHJ01sJjmtVAKuyKmcfadMXDu0af5Q==@lists.linux.dev, AJvYcCX6W3IAR0rlgAo+N23Qp/oVIFI77jpgk+fo8AS/clFPV76W4AyVrJXNCTdEKAjzgr0KCJT5@lists.linux.dev
X-Gm-Message-State: AOJu0Ywmh5y3AWRoO6WpBrLWCYERmxsRzCE8yW6caejHxgLp3nerwseX
	45Xsk+WX+rPT/cem42FseU8Upiovf0ryiN9CzV2U6h1snBnhNDleByIaEUjl
X-Gm-Gg: ASbGncvvDXZRx10Am3E0juj3mpQRaN3Rr1lyCshgfCu+IGkRYLK0XhtrizrBbH06yMg
	m1D+KIbr78gGUnxUPvfYu5BrbJOlj9rU4cch5koZxrxMk+MJDySxDKyzkWZfPQNy5bFv/fiT0j1
	adQcFTm+bTVBOOwvfC7qKx320eyLLLa9aXyKlfzdsoO4VJK+YBdZegB1hwD//Z/6zkbyChWmQoU
	RrBgAL/bVV+2VupBns6Tf3T8uVAxrGdWA/TavSjNFggysoEXPaearSHK5SnXox8kQFgPvpKxSgq
	bXuZPYmAxwAF/GdAvgHSNkNT5mvtVxegMYKlITN5tsyJ
X-Google-Smtp-Source: AGHT+IGqCsXnkfC76bFXMbUjIXevmryzQgEal5+s3NWi2W3zDAzeb9s6R0Em48UhoyL87fptsSZghA==
X-Received: by 2002:a05:6402:13ca:b0:5e4:b66f:880b with SMTP id 4fb4d7f45d1cf-5e59f36050emr2599867a12.6.1741165833326;
        Wed, 05 Mar 2025 01:10:33 -0800 (PST)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c43a6ab7sm9344888a12.74.2025.03.05.01.10.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Mar 2025 01:10:32 -0800 (PST)
Date: Wed, 5 Mar 2025 09:10:32 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Wei Yang <richard.weiyang@gmail.com>, akpm@linux-foundation.org,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	willy@infradead.org, michel@lespinasse.org, linux-mm@kvack.org
Subject: Re: [PATCH 3/7] lib/rbtree: add random seed
Message-ID: <20250305091032.fecpecvvxravtjyp@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20250304011952.29182-4-richard.weiyang@gmail.com>
 <202503051009.iTp8hlJy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202503051009.iTp8hlJy-lkp@intel.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Wed, Mar 05, 2025 at 11:05:13AM +0800, kernel test robot wrote:
>Hi Wei,
>
>kernel test robot noticed the following build warnings:
>
>[auto build test WARNING on linus/master]
>[also build test WARNING on v6.14-rc5 next-20250304]
>[cannot apply to akpm-mm/mm-nonmm-unstable akpm-mm/mm-everything]
>[If your patch is applied to the wrong git tree, kindly drop us a note.
>And when submitting patch, we suggest to use '--base' as documented in
>https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
>url:    https://github.com/intel-lab-lkp/linux/commits/Wei-Yang/lib-rbtree-enable-userland-test-suite-for-rbtree-related-data-structure/20250304-092345
>base:   linus/master
>patch link:    https://lore.kernel.org/r/20250304011952.29182-4-richard.weiyang%40gmail.com
>patch subject: [PATCH 3/7] lib/rbtree: add random seed
>config: i386-buildonly-randconfig-004-20250305 (https://download.01.org/0day-ci/archive/20250305/202503051009.iTp8hlJy-lkp@intel.com/config)
>compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
>reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250305/202503051009.iTp8hlJy-lkp@intel.com/reproduce)
>
>If you fix the issue in a separate patch/commit (i.e. not just a new version of
>the same patch/commit), kindly add following tags
>| Reported-by: kernel test robot <lkp@intel.com>
>| Closes: https://lore.kernel.org/oe-kbuild-all/202503051009.iTp8hlJy-lkp@intel.com/
>
>All warnings (new ones prefixed by >>):
>
>>> lib/rbtree_test.c:17:22: warning: implicit conversion from 'unsigned long long' to 'ulong' (aka 'unsigned long') changes value from 3141592653589793238 to 2721204694 [-Wconstant-conversion]
>      17 | __param(ulong, seed, 3141592653589793238ULL, "Random seed");
>         |                ~~~~  ^~~~~~~~~~~~~~~~~~~~~~
>   lib/rbtree_test.c:10:21: note: expanded from macro '__param'
>      10 |         static type name = init;                \
>         |                     ~~~~   ^~~~
>   1 warning generated.
>--
>>> lib/interval_tree_test.c:22:22: warning: implicit conversion from 'unsigned long long' to 'ulong' (aka 'unsigned long') changes value from 3141592653589793238 to 2721204694 [-Wconstant-conversion]
>      22 | __param(ulong, seed, 3141592653589793238ULL, "Random seed");
>         |                ~~~~  ^~~~~~~~~~~~~~~~~~~~~~
>   lib/interval_tree_test.c:10:21: note: expanded from macro '__param'
>      10 |         static type name = init;                \
>         |                     ~~~~   ^~~~
>   1 warning generated.
>
>
>vim +17 lib/rbtree_test.c
>
>     8	
>     9	#define __param(type, name, init, msg)		\
>    10		static type name = init;		\
>    11		module_param(name, type, 0444);		\
>    12		MODULE_PARM_DESC(name, msg);
>    13	
>    14	__param(int, nnodes, 100, "Number of nodes in the rb-tree");
>    15	__param(int, perf_loops, 1000, "Number of iterations modifying the rb-tree");
>    16	__param(int, check_loops, 100, "Number of iterations modifying and verifying the rb-tree");
>  > 17	__param(ulong, seed, 3141592653589793238ULL, "Random seed");
>    18	

Thanks, will fix it.

>
>-- 
>0-DAY CI Kernel Test Service
>https://github.com/intel/lkp-tests/wiki

-- 
Wei Yang
Help you, Help me
