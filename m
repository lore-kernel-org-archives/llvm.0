Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D77143C69
	for <llvm@lists.linux.dev>; Sun, 15 Dec 2024 19:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734292513; cv=none; b=d2ld8ccRaZpe6apxqz5sMsrS+moNlFc3Vk0p7v1d86jDhrtVVUOlq7Jb+JgKobmGHnErFT4tk0GaFyujhpYzmPtLqNnukbORiIT8rqwJ3Zjas7HwKrab1/kfaJe6+RLll5L8YUlG0c9WpT33nc6q8rC3/+QxNesEKTSwYEnoB4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734292513; c=relaxed/simple;
	bh=Ng0ihqJksultGRuuZdcU+Us0fVV6LYGGrSDynhO7HrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=axFj42LGoXs2LV4q7LYTgBaqNNJ6DizrbWDthvGFIaDPOZcKKCXfBMZLCV8aPBhZNqhneY5Pm84Xb4Ya7WyVC36FVPlXADcPkg2H4j62oFzA8rV51PECbqsOi3ZwqTt+fqojWQh8TGB5gSjnb7k9ya/0thElze4bu9feZDaqqic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=clLaHhxq; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="clLaHhxq"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-467a3f1e667so15683191cf.0
        for <llvm@lists.linux.dev>; Sun, 15 Dec 2024 11:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734292511; x=1734897311; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KutpQX//29f7Zqo+JdG0d9ubSIqFItXcJu0uFi63PTo=;
        b=clLaHhxqjSOfklAYowWqqIRc6YgFjezuaBEU52y7mg2SneBniYGnXOnO5+dOm54zrM
         Jm5SbjToKO/WYz/Uo+fqVSSwYAKZohD/Du27OUicNmmKgfmpZC6ldGy4SIKFaobD6A5b
         RsJdUzvehjUfoLE9o7QpG7fYdUWt3I/05YIU44S+VmucvBIlsLZzHZOv9YsBjG5l0Xl/
         PlUpwJgiGsn0lHFhISidMcTB5FOdWKt1Ya/eh6kjVCidz/1/l4TlBdM3CJNOnDX50tYO
         upXlal1XueVYLSKjCOP0vjPwKHVcXpNpaKA4Kr75eqTgDe771gTlRexWCA6STzOfN/VZ
         gJTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734292511; x=1734897311;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KutpQX//29f7Zqo+JdG0d9ubSIqFItXcJu0uFi63PTo=;
        b=OjBj0QhrsUxoIrHi+JvHi4FfPG7xBso+B6ebiuFYJ0rvrEipIYIwgQaBZalMRWD4qc
         8NbEIOnGpgvzmfVzhx9P7LxzpRxMi++QlhoaP1JdNu8yckl4SUXbhuIu60pIxZhtu61k
         CREfYwL/M1jk/T6+o1ayx7/dDsSK0uA+QZ6xTgbZr7bhYxUwX6Mx/JmI+j3BMHXFXtUM
         /jZOLqnkc2ENKgLIiifY9PqWQp2pNb3cQsQ45APgJVWB2S0Ovh3GrkZnPCpcn2SCtuwo
         f9kBGdgbK3thZ/xihQd4A/Mt00EIfMVXMAR81J01qjSgvU3JyeijXg3pO521UrSwv2ZV
         zpEQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+rUenuxDyx6pna9rHqddbumaI/LKz1iCVUsnXiQLvHaAnj+LeKHrlh7YeUkF47jnUxBF0@lists.linux.dev
X-Gm-Message-State: AOJu0YxZebWzDMrjUI0AHByxZ4ROc/OOpgEnlS7vX0VBg9Quo8/gGyUV
	uZfgS4CMkkrcfb98/mO1ZYjQSux60k6glBxPwuWH/mxeKDG1RQDJ
X-Gm-Gg: ASbGnctpTGbXzBrYtQNIyqHqyB1Ekp9DTKmTnkz1IEBe/MCzZrFHLlZ0oIWx4cJ+rA/
	va2pQfwb1Ia0zcaoc/PuCmz/yzKKJ3OIimXUwsASY85wxGKMJP8W3k155j1RxIv1EoT8wTaTrke
	b3e7vNaT4RdWcElY98qba1Gbe824qXRShzDj+uJvEHFnl+YPxMbBNw6aF+harpfD8+QyOEOuMYf
	XxFWf8GefMSMCEROv2fypJX0jFEGBXptwWn5JVVDd6BSt0AotwuUG8Y6Wy57+yUA/XcLYV0/p4X
	IlgagGVZ0f/40+9rIwfwn2MlseD8OKiZ8gb0Yj2vbrPqgPM=
X-Google-Smtp-Source: AGHT+IF7QGOrB10m8TSdkPb1lL5qpq+ISHcfE235eXXqPxvCD743BLg+mfmQ7wkjVK8VmGQYNle02g==
X-Received: by 2002:ac8:7dd6:0:b0:458:5716:fbd8 with SMTP id d75a77b69052e-467a578fbe2mr211410361cf.32.1734292510865;
        Sun, 15 Dec 2024 11:55:10 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467b2e83fe8sm19812841cf.65.2024.12.15.11.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2024 11:55:10 -0800 (PST)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id A5186120006E;
	Sun, 15 Dec 2024 14:55:09 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sun, 15 Dec 2024 14:55:09 -0500
X-ME-Sender: <xms:HTRfZ-Jm6BvA1V7uv3nyV_-r07id1ZQaZe5ON0hCt7RkcHsndKWGFg>
    <xme:HTRfZ2L2sMoyct16m5tAdGb34j7kAYmNTji9lueNFnjxcoFw_-Cz8tgWoCoXmC-XP
    IPRTpciJ7ovN9tFeQ>
X-ME-Received: <xmr:HTRfZ-tLbWAMgmQeipmzrM-46A0eavdPh1tHQB3_AAW2j-q1Hj645QvkbPbu>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrledugdduvdekucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:HTRfZzbhRUzwzmrb59t6nrKR_67KK1EPCQQuVE6z69tLCi7rH_FLTA>
    <xmx:HTRfZ1YsI_AMQuAv0T_tWUV7HXYPEH9a8TbbsU69aihW4PgWXv_xbg>
    <xmx:HTRfZ_DA_cwJ6cr39moHoP72_WLIe-OpnNggUXN3Uo_ICc5olhtvdg>
    <xmx:HTRfZ7ZXQLNuEnNhLsAG-ZBkFI8oIN818B219rY0qt5lTjqMHsBIEg>
    <xmx:HTRfZ1qpq9lkYqpBRJYQKQiI2s10VuRBCg9X6Iy72q0SmBL8P_XVTKeO>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 15 Dec 2024 14:55:09 -0500 (EST)
Date: Sun, 15 Dec 2024 11:55:08 -0800
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
Subject: Re: [PATCH v1 1/1] lockdep: Mark chain_hlock_class_idx() with
 __maybe_unused
Message-ID: <Z180HFO6a61PtzYm@tardis.local>
References: <20241209170810.1485183-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209170810.1485183-1-andriy.shevchenko@linux.intel.com>

Hi Andy,

On Mon, Dec 09, 2024 at 07:08:10PM +0200, Andy Shevchenko wrote:
> When chain_hlock_class_idx() is unused, it prevents kernel builds with clang,
> `make W=1` and CONFIG_WERROR=y:
> 
> kernel/locking/lockdep.c:435:28: error: unused function 'chain_hlock_class_idx' [-Werror,-Wunused-function]
> 
> Fix this by marking it with __maybe_unused.
> 
> See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
> inline functions for W=1 build").
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

This looks fine to me, so I'm going to queue it, but could you do me
favor if you could share the exact configs that would make
chain_hlock_class_idx() an unused fuction in kernel/locking/lockdep.c ?

I might add these information in commit log.

Thanks!

Regards,
Boqun

> ---
>  kernel/locking/lockdep.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
> index bb65abfcfa71..29acd238dad7 100644
> --- a/kernel/locking/lockdep.c
> +++ b/kernel/locking/lockdep.c
> @@ -432,7 +432,7 @@ static inline u16 hlock_id(struct held_lock *hlock)
>  	return (hlock->class_idx | (hlock->read << MAX_LOCKDEP_KEYS_BITS));
>  }
>  
> -static inline unsigned int chain_hlock_class_idx(u16 hlock_id)
> +static inline __maybe_unused unsigned int chain_hlock_class_idx(u16 hlock_id)
>  {
>  	return hlock_id & (MAX_LOCKDEP_KEYS - 1);
>  }
> -- 
> 2.43.0.rc1.1336.g36b5255a03ac
> 
