Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792445036;
	b=KmY/mtqO5Hwb2nGVp8+PUEku9qOl+2fRANbtnNViytORYPlDJWAf2ZLavQx/C1NamsRv
	 Xxb1BKfVqMRJxk9x1pK0dlyCWpfa4ZsuoGy8ntCvCrmZ+mJbL2QDK5RnoKGbNYGWQ7ZZG
	 V0PfTeb073uUnr+WlkbX1WIzTuRZAIFP5l55Vgv1/v6swTc0NAkBMoK0ecb5E1cvjT9ku
	 Q5STgY53QMpSPC+NX+FpvmV2yzCH8UJ4YXSFLSLxi7MlWxzzSqZNGmSw12igmCVAX0Y4S
	 NuqOhKAvnk8z2l4FWOhArVliZiMBLakeaT85SjxLZwlUIIej5GjK49G9UHqUStlUcYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792445036;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=RaSAtodmC/zEZWFNfit/fgpW8kKnO7aYgRQp3aEBxrU=;
	b=c6FrZoGrhWrFqzDcOurzjHFJiW91axCxkyGBQ6FN7NehlOBPuM5XHF2gy5lkWg7va3Oy
	 CXYeiL0DEIxcQ+xtD6ldp++jJgn28kwU8rzA8SWHTzEwVEWfg1nXaAndZ/CmUuphOECLf
	 qLoFMzZ1pTD4JvmGUA5CAJsdi0QzbZqmFG6BiuSGp+UkDImW8HQ2NgY7csENg8KEswWQq
	 Yo029ZR4BNZzOQJUmCY/z885XBYPF6+XxVgafNEAy0bg0sb71MeZjhR0SmRUaAulPKidd
	 4H2dHjiHtmhjomMb6afDkdJB9MgX7z10KcWiuTbszXJAaX9rWPi3nZWp4JYd8I+vY4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bvjbG3UL;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF59A606A31F
	for <llvm@lists.linux.dev>; Mon, 19 Oct 2026 21:23:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF59A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bvjbG3UL
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1df146015so14251145e9.0
        for <llvm@lists.linux.dev>; Mon, 19 Oct 2026 14:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792445034; x=1793049834; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RaSAtodmC/zEZWFNfit/fgpW8kKnO7aYgRQp3aEBxrU=;
        b=bvjbG3ULgs5lVGdYLaDDB8YbgLhAE3JciWU4l09U+Z4VRPK/JK5d1Pvv8s9YARjdZt
         P6TOu/FPV255FT2bBn2fuxuYdiFM0EGHl9QKktKtCCC0vy/15/YAsFkS422PEmzX8lrb
         6bdtDzerJydkGiDSbqPXneca1K0A87IrXEUr7bMOYktEjX3OQ2id5U2fbaRo8qRh/LQK
         OmGzH5YWlIA3/S4wjyYmfJwjqbMDkfwGN5de7KhNHV9Qtj0gT4Gx77MMeyuk6sMJ1qPT
         10CH+aoBSr6oWnYqZztnHdnU7ZZTviiljOaomujnvq/VshkOQk8dkzVZw61sU2tcbH6s
         aPgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792445034; x=1793049834;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RaSAtodmC/zEZWFNfit/fgpW8kKnO7aYgRQp3aEBxrU=;
        b=wGWkmZFh2WXw8Q+eLxmuykKEIouTUphEo5psK5m9WivdnFSa60RE8kUudwlgTtTnkJ
         o3HstWzucbqEfDqhjR30S3w7PgGbax/7EeSzniJpTbOHlhRvu+dfBMg/hLWybaimgnQz
         39Lqvagycr3ALv6aiiwfDrZ1CNmWOgQkcv61W1fp/q2SY7U08tz11VxgFdVJz1h5l86q
         BFsugpuSznSP/P1cHSpEB5XW5iToU8uPM3nxcQvtLHzA9g42DKU0zDwEFCse0w4yzJGQ
         bjBYrR3LiE8EkGR4D2G8v2rW2yJkh9GHkvP6josH/u7eymCAj+VcHdYimznq4Wc68z8Q
         staA==
X-Forwarded-Encrypted: i=1; AKwUvBzTlPtHgayeIG1kJJstKRzToguIFTfs4EDJ4RowtXY+kdUfrcy+Uj17anFICEuvkOsnfBPP@lists.linux.dev
X-Gm-Message-State: AFq9FYIFXgzAjbfen0Vyrt1YFmD7h8d462XK5imHdYJKCFaiUKoK8Ypp
	AxAvPwZ+zIDqbDChzM75Ii/9Z/UlvBPzIy6941fyRVq/R7cVXDDM9z3g
X-Gm-Gg: AYBFou3J/MVTV+QbeFA/8rk5v7Ku5WS42mC3xtQVdQVk5hWkurVWsZmSauOrLQtgCfk
	V2dmp1Tnn0cihpnz9I6mkjTPPtpuhlVIjmHLgcW7up3rK+9v59xt2n6+wB8KKWTN+jKrwHmptvi
	SgfjCHzYjHMgROyv19WRBp0xz6NkZhKu9LzmDDd9G7BINTrrmpQx8PPlC40PolG9R6NWaZxrE3s
	EMfgnW0lmJjwehLR2qd9FENBjhI0MgiNtgEkWKN6faXrMCmpuWzBakU5hADmdqw6kqiKTjs+poL
	32qoekY8Vbo3OyOgTdOOsVNDdfx9RV80lFqDpiJRsKfElT9ZrQW7hDxUN4f7dNboj6bG5URKLJ+
	+D/50eI3YGAjscYtteYk/QMf0A+GFwsHC1waJNh/drF1Mcw/VxFGox3/R+eHYEWakjh/+2+itaG
	fg/NBgiuWLdXJGf+POYxT2q6KNOmk0O33QJotPvq5aLvRqQuqPplPXUDMSjJ6V1hw78TUBUV2//
	wGa9iqLTSQ1m9nqLpc0xhLEIO9V2hUJ2HG57ZH1N19SsQ==
X-Received: by 2002:a05:600c:e549:20b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4a1d7624601mr116807835e9.26.1792445034012;
        Mon, 19 Oct 2026 14:23:54 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1e2def9ecsm97956265e9.1.2026.10.19.14.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 14:23:53 -0700 (PDT)
Date: Mon, 19 Oct 2026 22:23:51 +0100
From: David Laight <david.laight.linux@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Petr Mladek
 <pmladek@suse.com>, Kees Cook <kees@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 bpf@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>, Lorenzo Stoakes
 <ljs@kernel.org>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>, Luis Chamberlain
 <mcgrof@kernel.org>, Andrey Grodzovsky <andrey.grodzovsky@crowdstrike.com>,
 Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 14/15] kallsyms: scripts/kallsyms: Reduce the output
 file size
Message-ID: <20261019222351.64bb9d35@pumpkin>
In-Reply-To: <202610200336.6v4SE96n-lkp@intel.com>
References: <20261018155206.132411-15-david.laight.linux@gmail.com>
	<202610200336.6v4SE96n-lkp@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 20 Oct 2026 03:50:35 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi David,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on akpm-mm/mm-everything]
> [also build test WARNING on linus/master v7.3]
> [cannot apply to next-20261016 next-20261016]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/kallsyms-scripts-kallsyms-c-Avoid-overrunning-on-stack-buffer/20261018-165152
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20261018155206.132411-15-david.laight.linux%40gmail.com
> patch subject: [PATCH 14/15] kallsyms: scripts/kallsyms: Reduce the output file size
> config: um-allmodconfig (https://download.01.org/0day-ci/archive/20261020/202610200336.6v4SE96n-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261020/202610200336.6v4SE96n-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202610200336.6v4SE96n-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> scripts/kallsyms.c:371:26: warning: adding 'int' to a string does not append to the string [-Wstring-plus-int]  
>      371 |                         printf("\n\t.short\t" + !i);
>          |                                ~~~~~~~~~~~~~~~^~~~
>    scripts/kallsyms.c:371:26: note: use array indexing to silence this warning

Hmmm it gives the same error for (!i + "string") even though that doesn't even look
like a broken attempt to append to the string.


>      371 |                         printf("\n\t.short\t" + !i);
>          |                                               ^   
>          |                                &              [   ]
> >> scripts/kallsyms.c:371:11: warning: format string is not a string literal (potentially insecure) [-Wformat-security]  
>      371 |                         printf("\n\t.short\t" + !i);
>          |                                ^~~~~~~~~~~~~~~~~~~

The compiler ought to do better there...
Indeed, gcc does.

...
>    366		output_label("kallsyms_token_index");
>    367		for (i = 0; i < 256; i++) {
>    368			if (i & 15)
>    369				printf(",");
>    370			else
>  > 371				printf("\n\t.short\t" + !i);  
>    372			printf("%u", best_idx[i]);
>    373		}

I knew I should have interleaved putchar() and fputs() with the printf().
They are somewhat faster - in this file it is measurable.
gcc does convert printf() to putchar() or puts() but not fputs().

The time taken to write the files halves if I initialise an array with all the
",%u" values and use fputs(str[byte_val] + !comma).
I decided someone would object to the mess.

I'll think of something for v3.

David

