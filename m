Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8BA1A3AA6
	for <llvm@lists.linux.dev>; Thu,  3 Oct 2024 15:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727970729; cv=none; b=Vstbs/ZNlK2IePpLPRyLQwhtLkrWCCQeIZkYQKiQVbBHHEXmoQfvrWt6r7kVixrjRq47jvJeTK0fwJJ/gOuaKbQVrT4mQcq9TxvZyP3/9sDduFyVPBa5M7JYM30zpCQmalcg4blMsOM3lb0qDJUbqU/SutNwyL/TZBWmMiUvUIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727970729; c=relaxed/simple;
	bh=R5rdrwIK8Uzh/sQ+IM2Lv+MemaBwurDAhyD5kocYkJ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZnnitJWt4XsN1hr7a0VyyPMd8BXzA3X13ZKvyoWncrVBqJKB5WUdtEtf0FeN9daPceZVUnA7IQFUio+Ff644Hks4CJh/uhbUuP5YIADs/6OJy4yWZuTIzJJ09lNGje0Z4r82KegvAb35cbIT89xlaNU3YIkyRIOdutfF7Bt/Pmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uVoVgJYn; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uVoVgJYn"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37d00322446so1140893f8f.2
        for <llvm@lists.linux.dev>; Thu, 03 Oct 2024 08:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727970726; x=1728575526; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YBzNppjoku0r7wseF+PbhPszUDrB/uxiwrRiITy3hfY=;
        b=uVoVgJYnnyKXD+MAk+hTNBQ34q4ULMm4FICL+7i8wFn0WrjQx9Gg0X2ekih8uuGiRg
         aflCtC3KpUn/Xl04oMAdGRkimVLVY6w6S18i2D+thpvdOTyHHPqfEwnkNw6azv60TvqW
         vMTC1M0cSV/Lu7VvVSSpM1f+TEuCr9/KjKeUdB0M7UwM1hIdKKQ+TtcTKzpcmlfYLTiE
         Fhy+EXUFH5CAAV1fJmR+sHs26OCTln9xpItb1u3MvO0RzirZXkxDaDrq4mqqpEpywFe4
         WDXBY9k8x5ej2OACqfCZfAYEXSjRvzH6Teg/2DKy5BVDw1Jo3mjP8002xi5TuE1RGT5m
         U5GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727970726; x=1728575526;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YBzNppjoku0r7wseF+PbhPszUDrB/uxiwrRiITy3hfY=;
        b=kmeS6gI0y47AfItKJi16WoRBQXz/3WyyzQJX4+jIrSJON8dOxYoUiNYigs3jrEoNTg
         qbDxQyI9Y4zc23U/oP/zCkXooUiG+fklFA0/biPjQ3AKRUhYNl/9kDJPXOcL5WvD4eMm
         5XCP3GqpGppjrr7f8W6+IVA7TE0RZy+Yn5Oegjq1e2D8yQ0bVA5MMZb3ZesgoYrjUNyo
         rLvz0RcW/CEUfOxB/Wj+YQgqyCZgyauGPjcxn6qXl9vJI0OUWQRgCV/bt3mA5yfq3fmS
         sqWjORCINQF7ECbgD6ZvzF/NcC2Uui0C6/OSaQIqCfkZyRshZBWJ5VX6Zg2Eq4JetLW8
         upqw==
X-Forwarded-Encrypted: i=1; AJvYcCU5eh/CKtsPvrUM4ERSapAGWxg/o0xvvumw8eUaRQl3SlMFtNfqkgH6rbQXoxykmApY7LrA@lists.linux.dev
X-Gm-Message-State: AOJu0Yyt0dnjTKzBg667yemtwAgZNXyIJNBv/b/nYK6OSeHY0FLSJlUI
	dWBWjb+UaCeMqhmkZXyMnI2fJnFYSITxxj0WhmXi06fCG0mDG4HWawCE6bHAlYgRGvNFWdxcmUd
	o23VpbgF8G/sNRWJFBCYWp/rJ2sf72E8nGKR6
X-Google-Smtp-Source: AGHT+IGPEhCP23/1eAR/xoiZesp8muQ06ZiL+lHkT4wcjYh5BmgAWPboo+L38mnUbZhHPjyv0/bIj8PqGVc9tATpGig=
X-Received: by 2002:adf:a2d4:0:b0:37c:ca21:bc53 with SMTP id
 ffacd0b85a97d-37cfb9c54a8mr4724671f8f.26.1727970726177; Thu, 03 Oct 2024
 08:52:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241002233409.2857999-1-xur@google.com> <20241002233409.2857999-2-xur@google.com>
 <20241003154143.GW5594@noisy.programming.kicks-ass.net>
In-Reply-To: <20241003154143.GW5594@noisy.programming.kicks-ass.net>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 3 Oct 2024 08:51:51 -0700
Message-ID: <CAKwvOdnS-vyTXHaGm4XiLMtg4rsTuUTJ6ao7Ji-fUobZjdBVLw@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] Add AutoFDO support for Clang build
To: Peter Zijlstra <peterz@infradead.org>
Cc: Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, 
	Sriraman Tallam <tmsriram@google.com>, David Li <davidxl@google.com>, 
	Krzysztof Pszeniczny <kpszeniczny@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>, Breno Leitao <leitao@debian.org>, 
	Brian Gerst <brgerst@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	Jann Horn <jannh@google.com>, Jonathan Corbet <corbet@lwn.net>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Juergen Gross <jgross@suse.com>, Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Masahiro Yamada <masahiroy@kernel.org>, 
	"Mike Rapoport (IBM)" <rppt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Wei Yang <richard.weiyang@gmail.com>, 
	workflows@vger.kernel.org, x86@kernel.org, "Xin Li (Intel)" <xin@zytor.com>, 
	Stephane Eranian <eranian@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 3, 2024 at 8:42=E2=80=AFAM Peter Zijlstra <peterz@infradead.org=
> wrote:
>
> On Wed, Oct 02, 2024 at 04:34:00PM -0700, Rong Xu wrote:
> > +6) Rebuild the kernel using the AutoFDO profile file with the same con=
fig as step 1,
> > +    (Note CONFIG_AUTOFDO_CLANG needs to be enabled):
> > +
> > +      .. code-block:: sh
> > +
> > +         $ make LLVM=3D1 CLANG_AUTOFDO_PROFILE=3D<profile_file
> > +
>
>
> Can this be done without the endless ... code-block nonsense?

Dunno, I think it looks pretty nice once rendered. Makes it
straightforward for a user to copy+paste. I asked Rong explicitly to
make sure the documentation made it so that non-googler or folks not
working on autofdo or propellor could reproduce (since we'll probably
end up standing up CI for these newer configs, and BOLT).
--=20
Thanks,
~Nick Desaulniers
