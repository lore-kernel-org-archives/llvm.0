Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3692931C6
	for <llvm@lists.linux.dev>; Mon, 27 Jul 2026 01:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785115726; cv=none; b=YQ7gC7hgP7EBCmn9IQd+cj+69egeMzVUJonjZILmjoJlqIcwIn55L4y2hkCVpVR1GtOyneRLiMCQ/cqO+ZfJyFIRL/t+PNSm5AsQrzVP4Uo8O/EUwgnWhtSfXEhiQjer22DQftQxnw5OgAKEZlYmoqtoRB1tgbMmgVss7jWuS7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785115726; c=relaxed/simple;
	bh=LsdNLXzG+2oi8st6LkBT/jm25MgJi7X7MpYpwrwfa08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kCJ6/JqvKZ3ky4E3CMk7QUK5uvzukNGeq9Jih2DgW+cc8wKVFuIvphMZMsQeDzTVLNE2AG9EifZbyJgSv2n6qowSWM5jL9LBMuyXMEf8iccg1y6QLKAq4vLk7JbJlx1MnjEnQLh205w1VulaA8PoGufMzHWbPb0Vexk3VqT+W9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SWSp8+sm; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SWSp8+sm"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47db714766aso1585580f8f.0
        for <llvm@lists.linux.dev>; Sun, 26 Jul 2026 18:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785115723; x=1785720523; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J+YAafdUWyy4iyACMaMYl4fxl/7MRA/3Ye5L0fqVOqU=;
        b=SWSp8+smnEaWCK4BMEQp0IOj9a3fBBPWUwl5IYHw94+BKrednVbinDDw1jHaytyrqb
         BxR52hJtKfkUhtd1V6id2wSjjsFOthNdaDb0vRjEnRh6ZxLwoYwHiNp796ylmb42LXaS
         DtLV99XRHazTmO0puDxn6Vg5+nKMScFbiRunpCNCw5A8RSUXV/ERi9wNw9lS2MJC4uWX
         FxrTMNkZdQ8laIeR2QksjTNl54D70a37isgKNLo7bN4GTHaaMgaMvTVa7r52lG5US7kW
         AdDdKJg0/3onF4Mh+eW551bTQhHCLEFBw0dwRkeAcJ5sKtB5Azn41aSn8J/yHDgNHji8
         R71Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785115723; x=1785720523;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J+YAafdUWyy4iyACMaMYl4fxl/7MRA/3Ye5L0fqVOqU=;
        b=drkRnZm/m3ZQcSA6L2giShe64uz6TChBtu2RaCcfmHzGDjUmCoOj0UTUhr679Kx1r4
         u8WENMFwSzLCkAIz7A1UQNQffdKJiezuFnBSz1fVtT67Ph/GDG3lHzHJM1cV3M2zUyMG
         fIMSxTFs9T8fZyiiBuCdRdfRbC5Sx6z3WhLahF0fuvXq82gtVIZQBZA0YFu1Lj4b6xSv
         XWdXdALGPVTxqxzV1a4tu5zrgjW5weYCK5MVTl5psQKQ5yBdaMSWfOEoiMVhR4cN1F/U
         e230L/rJ/WtABI4Thv7K+Gr0Qo2LbGs6PiMxRgo1j+M+pkVZTl0Cq9EYan1iPgdt3u9p
         poQw==
X-Forwarded-Encrypted: i=1; AHgh+RoZPO6ZVglEavVEi0uY/oD5DnuHI3h6y4sToTZ1Zx2D7BEFaPpovNu7xu7ONMCFysO00664@lists.linux.dev
X-Gm-Message-State: AOJu0YyCMvc3p/n7PkGToQJSwHBDHET7Daptu/UszULpW9I0Zh1cfsNB
	hbc0rs24N+mn2+FSYsuRvOyJfKv9VrFIvYoz1tTphC3y4TsgGGvg4s7b
X-Gm-Gg: AR+sD10d/lZZESE1Qc6Kbd8aL0Dro5uVem2xQmVxaQECGJ0647vnoceKA2aADlKZROk
	metTqxrWiq1Z5B0kj/DDhuFrGRhYHvjT0D9YQHpbBLvsP2Jk2FShYzAI6/XwSRldSyVaQpNAgV0
	2OUIu2aAag5+31Ocd0gm52pYxa7MKI57RsLbI4nEcdWuSwnpm5i9NBI4PbQLZZqNYL5fOvFV4TK
	FbaPJkoQH1DZ4pBh7xFOnx6rEekzi5i8H+eMr0idjbB5XE0BOTxVrDZ0wR2Jx/OtOiCbIPrlIOb
	ACZ/02WdN7HXAgIqRsKUc87fGzPGVV30+/i1xzBrwMi44cqIrzBDyIegiaSAjCuikjlK84QOG1v
	TMBIWs+p8M/ilOHqiYMeAMsQhEIWbBNZnEzAHDSCN6IYdzWDgYpIWUVF5fV6MXLlc5t/ub3kuN+
	TeVq7om+Hlul2+aRMRsBlp5faXsefvux5QhmG3MiurjemH5eUMUJNdueYKTdo/5kgH3aw6028hp
	ZNHXC3VZx5Uyi5gOT5U/KHLJBOCRAYB7xLW8Mpjuvo=
X-Received: by 2002:a05:6000:2903:b0:45a:5392:3a19 with SMTP id ffacd0b85a97d-47f9cdff8abmr11557115f8f.16.1785115723100;
        Sun, 26 Jul 2026 18:28:43 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-095-114-116-215.95.114.pool.telefonica.de. [95.114.116.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f96d4656bsm27341954f8f.21.2026.07.26.18.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 18:28:41 -0700 (PDT)
Date: Mon, 27 Jul 2026 03:28:09 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Kees Cook <kees@kernel.org>
Cc: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Linus Walleij <linusw@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Zhen Lei <thunder.leizhen@huawei.com>, 
	Arnd Bergmann <arnd@arndb.de>, =?utf-8?Q?Micha=C5=82?= Pecio <michal.pecio@gmail.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-arm-kernel@lists.infradead.org, 
	Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3] ARM: traps: Implement KCFI trap handler for ARM32
Message-ID: <amazbT2M9PQgb_Vq@gmail.com>
References: <20260715175223.make.153-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715175223.make.153-kees@kernel.org>

On Wed, Jul 15, 2026 at 10:52:27AM +0100, Kees Cook wrote:
> +/* UDF base pattern with KCFI bit: cond=0xe, 0x7f, xxxx, 1xxx, 0xf, xxxx */
> +#define CFI_UDF_IMM_BASE    0xe7f008f0
> +#define CFI_UDF_IMM_MASK    0xfff008f0	/* Mask for UDF + KCFI bit matching */

With this patch applied, KGDB and CONFIG_CFI cannot be used together. 
Setting a breakpoint causes Oops as CFI failure.

This patch on top of "ARM: breakpoint: CFI breakpoints only on demand",
multi_v7_defconfig + CONFIG_CFI=y + KGDB/KGDB_KDB/MAGIC_SYSRQ, THUMB2_KERNEL=n,
clang 22.1.8 LLVM=1, qemu-system-arm -M virt -cpu cortex-a15, booted with
kgdboc=ttyAMA0. 

Then "echo g > /proc/sysrq-trigger":

  sysrq: DEBUG
  CFI failure at kgdb_breakpoint+0x2c/0x58 (target: kgdb_breakpoint+0x2c/0x58; expected type: 0xc0472d70)
  Internal error: Oops - CFI: 0 [#1] SMP ARM
  Modules linked in:
  CPU: 0 UID: 0 PID: 1 Comm: init Not tainted 7.2.0-rc3-00278-g38436106b2f5-dirty #1 VOLUNTARY
  Hardware name: Generic DT based system
  PC is at kgdb_breakpoint+0x2c/0x58
  LR is at kgdb_breakpoint+0x2c/0x58
  pc : [<c0472d70>]    lr : [<c0472d70>]    psr: 60000013
  sp : e080dea8  ip : 00000000  fp : 0021a1c0
  r10: 00000000  r9 : 00000000  r8 : c2004048
  r7 : c2205d9c  r6 : 00000000  r5 : c1609558  r4 : c22bb994
  r3 : 00000000  r2 : 00000000  r1 : 00000000  r0 : 00000000
  Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
  ...
   kgdb_breakpoint from __handle_sysrq+0x150/0x158


Thanks,
Karl
