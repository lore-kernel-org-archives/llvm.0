Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6741991DD
	for <llvm@lists.linux.dev>; Sun, 15 Dec 2024 20:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734293304; cv=none; b=jQiH857JKtvO8GGXhrm+1YpJo1tH5uEj5uXWVmk07+LZTlC2+uTfZ7cN3VtQ7PyBxDlEodp7fb8leC9bE+rCL0JQD3CCshEL4IXK4kDELH93WZtlkXcpb1D+iPkf86qXIYEBR5D1TWvOiHMGz401EvYFSfQvBK8HKw020sql3Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734293304; c=relaxed/simple;
	bh=82lBQhfy4ugFlmtxzGDkFOfRQrea802BAqDqgjRI+Bk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MgwMjdnFul4/XEGnH0gOv7Uc8AHuxU4COjsoTldEqb+1PB/KN+cXuLBa0u4cxtpJJElwE8NjOCN+vJyGxX9S4E5YHvJ6whvgVnGtBDOY76F3f6mhkaLlQqYGGSQEZR5r2BFAtP3288NZbrvnQZwb8IMLs5B+vMs+stAaWDNOVpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E+KYHl8/; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E+KYHl8/"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-46792996074so42181381cf.0
        for <llvm@lists.linux.dev>; Sun, 15 Dec 2024 12:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734293302; x=1734898102; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eDzgwa61e+om6LsGHubgAOxXOshOaf1zjEonOuJmqiA=;
        b=E+KYHl8/2jUkusZj1Y8+ljcVmSl4/zJE56eFWOFzI/USQgDk5OVLzHL+sp8VQ6sIfG
         hnIwYs8WNMBEVmcqDKFrd6WK7OOWEu+F/s+B2Lvk/Mef4n/nVsqd6I7U60uSKZQ7zjAF
         WcjwT+zKtGRUxmLc4/c7XGABsPfPh2pkBaxbJxR2WJ6tO/ZkkTYNe/T37E2BxSlIuepK
         FIRF+HtBgXfvPJRwDKvh3fUuSrMvdjoMI2WfMgAUzI4Eq36GYiPhwae19HCITZPgcelH
         gjBTcscJH9Prsz6HrKZZZi8vPQPmSeILKGsWBaMX6BXflXH1IFJx6JhuL2598N2iB7zN
         G13w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734293302; x=1734898102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eDzgwa61e+om6LsGHubgAOxXOshOaf1zjEonOuJmqiA=;
        b=DoQMPIYcorCfbwd2V/Ye/RqKUMXMhoQGjGsPoqOlXvQ5E5OXumQ7U4UmaMmUWmQg03
         hkiD/HE+oCTeohbu4v+ubL208AeKckREioaE5tresSZkKUQfWILpAemhI87L5iSj9zQ3
         5apd9iPsl5hiteH+3CvEOrqPfQeKSOCog9nDoj7juW+cYD0BGJt25wOLgM79F2/fSwD9
         m949Wc3bMYyeOjpstm7OjNZq/gGhIx2ZSE+zTWN/rzM/rFgWn3aGkQV2E6tzpJdaFgST
         yS0XHnKRviJ08uLzOZJeUVYzBk7u92AlTYB+1PuNFZ3/FYdS804L/qWRGzp+kF2WVPaw
         GjSg==
X-Forwarded-Encrypted: i=1; AJvYcCU1ASlVLCEsajLhr5q4u5afRoImtJzp90sxkNsJXGeVvhJDT/94VabzVfy+upKVfuFOLtMl@lists.linux.dev
X-Gm-Message-State: AOJu0YwOuc2ierODIRrRwIAqdZN4BuC7S1WIiubBQe17wRYTitnPRjIi
	pNM6eD+Jk/XtS7am+etojaaVSG7vpIb7UeGtapGfZTSqOLmKQf/C
X-Gm-Gg: ASbGnctJXlt+UXU7o4cfMAUVThGx9IfzNpg6g8hPr0FD+GYd/W8fXWoi0TCrXjvFVVx
	wtHK2HFMAM+ry028j8/mBHE/oSfslPmcOphywn1USuW1hRzXjEFs33DUM2H706kUVRHp9LFMnKr
	h7WlHyZRuDInqbnwxm2b4eoRjSA8GoGusYS+pg5bUQ6v6yGjnb3lfnQiB5iBd+V6dYLMvF6W4fc
	F9wBU/6NNw/olp0Gjk1m0EhXrSSSz/8mTadN7hoBzwBfOF+9/RMVwoLVlPjEBsHrwxgdq/HQ9yj
	GIKpM5A7HTL/YMZnFCmIjCdsB8a3nq68x4I9lTGpPOzpTO4=
X-Google-Smtp-Source: AGHT+IFWjPE3ccC6zX44KQ1hRdtd3zkraAOtpY+wfSfEq+cGdymbOq9rpKWmdMj9cpaAjqf+tF5QLQ==
X-Received: by 2002:ac8:7f52:0:b0:467:5462:4a10 with SMTP id d75a77b69052e-467a54bab28mr194892211cf.0.1734293302174;
        Sun, 15 Dec 2024 12:08:22 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467b2ca087esm20073701cf.28.2024.12.15.12.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2024 12:08:21 -0800 (PST)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 4C78F1200043;
	Sun, 15 Dec 2024 15:08:21 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sun, 15 Dec 2024 15:08:21 -0500
X-ME-Sender: <xms:NTdfZ2jAbtEli5nAm2pCSYWvaPoP2BY372qijFxRu3lCcsK0tE1HrQ>
    <xme:NTdfZ3B424QQhvGYDchEqxWMhF6QM-U8JCu3Il3HPzMn0gg54L-wEpakjwJafujep
    vaGTrrFig7WvENYag>
X-ME-Received: <xmr:NTdfZ-E_R96XOSFuYYdMFYQPaiGt238hTN7WwP_YAFEtcf-0IBe9Ug3Sa0q2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrledugddufeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpeehudfgudffffetuedtvdehueevledvhfelleei
    vedtgeeuhfegueevieduffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhi
    thihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmh
    grihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepuddvpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhose
    hlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghl
    sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhlvhhmsehlihhsthhsrd
    hlihhnuhigrdguvghvpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdho
    rhhgpdhrtghpthhtohepmhhinhhgohesrhgvughhrghtrdgtohhmpdhrtghpthhtohepfi
    hilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlohhnghhmrghnsehrvgguhhgr
    thdrtghomhdprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpth
    htohepnhguvghsrghulhhnihgvrhhssehgohhoghhlvgdrtghomh
X-ME-Proxy: <xmx:NTdfZ_TECe5bR4_1MpbNCsBpPxCSf6eu2aXCvI4QupWGW_yLzbYw_Q>
    <xmx:NTdfZzzYT4blah1-18vms1xPqrQZR794NZiNIUtjatTrkcH7FhsNBA>
    <xmx:NTdfZ96Ve8x6CZbjwvccK9iyVlSrsLwtyAKmhCzVkY1YQ7ebRdCbgg>
    <xmx:NTdfZwzViTgonunbME11O_54ORvG3P5FvLPvyvKBRWHDV3zse8NYcQ>
    <xmx:NTdfZ_hK2b9lmvtv1VF88AhC_boteAkrVH3VSUdRnFSNe1erabGeN6-H>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 15 Dec 2024 15:08:20 -0500 (EST)
Date: Sun, 15 Dec 2024 12:08:19 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH v1 1/1] lockdep: Move lockdep_assert_locked() under
 #ifdef CONFIG_PROVE_LOCKING
Message-ID: <Z183M9-JIH6mG3q9@tardis.local>
References: <20241202193445.769567-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202193445.769567-1-andriy.shevchenko@linux.intel.com>

On Mon, Dec 02, 2024 at 09:34:45PM +0200, Andy Shevchenko wrote:
> When lockdep_assert_locked() is unused, it prevents kernel builds
> with clang, `make W=1` and CONFIG_WERROR=y:
> 
>   kernel/locking/lockdep.c:160:20: error: unused function 'lockdep_assert_locked' [-Werror,-Wunused-function]
> 
> Fix this by moving it under the respective ifdeffery.
> 
> See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
> inline functions for W=1 build").
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Queued for more testing, thanks!

Regards,
Boqun

> ---
>  kernel/locking/lockdep.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
> index 2d8ec0351ef9..bb65abfcfa71 100644
> --- a/kernel/locking/lockdep.c
> +++ b/kernel/locking/lockdep.c
> @@ -157,10 +157,12 @@ static inline void lockdep_unlock(void)
>  	__this_cpu_dec(lockdep_recursion);
>  }
>  
> +#ifdef CONFIG_PROVE_LOCKING
>  static inline bool lockdep_assert_locked(void)
>  {
>  	return DEBUG_LOCKS_WARN_ON(__owner != current);
>  }
> +#endif
>  
>  static struct task_struct *lockdep_selftest_task_struct;
>  
> -- 
> 2.43.0.rc1.1336.g36b5255a03ac
> 
