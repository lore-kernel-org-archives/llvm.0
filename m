Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF56842669E
	for <llvm@lists.linux.dev>; Mon, 24 Aug 2026 13:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787579259; cv=none; b=XYqTg7+yx7nKsSCWPIt7e73wVENYXlrjdVfdnksgMSq/QJWNV1Du6DFlr20Oib5Gl2efzcJYMjVM/8CXb0FYsFs6Yt4vBE4NviIXoLKlq7XFC+U5wzknt9cFhqAWOnbaMXtoTbIxniDFBzQY8Cn9F1gUNuItx4cICxYYVZQzmek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787579259; c=relaxed/simple;
	bh=3F0jiyVTanJ+AsVc8N4FH60Qj2BcH8oGf1xExaoOipk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MTECy/sy+2YQLSVTLHVhlXVfXEDXAJGlrODR5b12zs8Cmb4+DEfcy6awlmK1ahZX1ldiJ7nFdIkWT7dUKsxyDKoy6g8xU+EIeXZAVI1alRhBtCn5X5ISEGPk1AS5L8fmYd6Wt24JgCBSHEmlUxSoHsBW0vqPvIGIH28LPcQE2D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7564b7a9490so3044169137.1
        for <llvm@lists.linux.dev>; Mon, 24 Aug 2026 06:47:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787579253; x=1788184053;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kyiJvlEUTZbfecKHieUj9osiaGG9GPJvuGru3ySDu2k=;
        b=VnJ3U9w8tjJDBhFh3Sfs580q9/SpkxKxYhwSg37QOVrOgrMGKZhsZhT8EaCGCriCPk
         6CVWQP360uNsCadTjZmar4QrPJdCcQGICQhHkVh8h2bMFThu6TDZ/Ua0x2RJPuOcJGmf
         nfUdwd5BsB/5agUV2esDrI+7bYqL9hCvGWtyCghP7YnTEw9htUpGCslUJthmKxyymy7l
         3GACKOGuxK6VSVgw8rVW085AeuRwiK6SETNdW50A+n9f8YTSsaVHC5/ThNf8yP5ocSiJ
         5k/zBbcRJfPHuz1mbciUilytrbgSWPJ18Xozn8ff4Mk30e8wAkeZqHASkGGJJoP8b/dm
         9hrA==
X-Forwarded-Encrypted: i=1; AHgh+RpFru28/mIKKTWyX4GkNzA3PIPnLeIYFCJy/wnRcf52Q4Y8ZCIwSSs9bgpms1olh8WxN3EZ@lists.linux.dev
X-Gm-Message-State: AFuF++lzAY8AwgjIdaz8+Zu8w4qXHTBoIBCwfBVVsRsZN1rI+bGtqbux
	sFcumIoHnMyg/URXrH/GqxBD5IV5HhyGbWOYi568bY7vgktT9xt40e2C9TipFK7k
X-Gm-Gg: AR+sD13FA2sfHsF4+jp0x41nAabW1jn/R+690FzndJydGTqMMzW2FNVL8Gven4/DdlN
	IObwcwp+/pgZC2myLId0vLmop5KI0+8R656GgYFlLvK91NdHVg6TJ1/KWYx1Danu4RphBJeHgOL
	2djv7rHai3tCjUTouA5RAgbzdznYzOWVyqYhdOCnj6wOhywv7eLReOMdfckG2LiRrVexZePpZie
	5JSKNMe7PK6okEQMY8kbGqlf1rWHaVeHohIvyrd5P+R5r5SDd6NuLMUyQNYvY/c2q8R4gRccFbz
	A4ze7lwdIlHvZO9gIhClfYgoHSJHvhkPgOUT6moFfyPhBA65a7HrQqBJ4pcMZkI499IiwC4UB9l
	75xdp/B2cN2XzClzWO3gOBX+YrReEhAA8zM2Xv1v29OIGEuyIHhJ3gsEps2ICt4p4ImqMMDPu6n
	N+XTZ88DkEDXxFDfoybLWvuZkiuLjzy9i87ldHCZIGXEVui/pywri2h5PVDL5H9dazy2bheSQPK
	E6YapR6X5PObZlMfmkck+d6Ow==
X-Received: by 2002:a05:6102:17d6:b0:736:f95c:4bd4 with SMTP id ada2fe7eead31-778f0cbe7ddmr6849442137.6.1787579252243;
        Mon, 24 Aug 2026 06:47:32 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-77d8357ccf6sm3000447137.4.2026.08.24.06.47.31
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 06:47:31 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7564b7a9490so3044136137.1
        for <llvm@lists.linux.dev>; Mon, 24 Aug 2026 06:47:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RovVpEYC/V0Cau+mxIKR1L8sVuWfI+mm30WYAjUrdHSWBrrirAsXdAGbk1xnFFL4t8Vmg2T@lists.linux.dev
X-Received: by 2002:a05:6102:244d:b0:6cb:b3db:c31c with SMTP id
 ada2fe7eead31-778ed3945cfmr5933099137.0.1787579250924; Mon, 24 Aug 2026
 06:47:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260728-linux-kallsyms-fix-v1-0-1a665156c898@linaro.org>
 <20260728-linux-kallsyms-fix-v1-1-1a665156c898@linaro.org>
 <CAMuHMdWEzs=+vuV0oX+v2WVukHNg+o5FspczHyZggY4ADHJKqA@mail.gmail.com> <73b681a103cecd66fe122cc225b08d529c2ed56d.camel@linaro.org>
In-Reply-To: <73b681a103cecd66fe122cc225b08d529c2ed56d.camel@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Aug 2026 15:47:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX=1ZPjBHh7bQyC_EEU47vLERf24U7vc9u5PgGZ4D8ULQ@mail.gmail.com>
X-Gm-Features: AcwNN1VyUy0M0rGPTbXT4r_algKfQ0yEW9eWKMfCEiPXt7KPRsCwaHn3b9bdeoM
Message-ID: <CAMuHMdX=1ZPjBHh7bQyC_EEU47vLERf24U7vc9u5PgGZ4D8ULQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] kallsyms: add symbol size for kallsyms symbols that
 can change size
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
	Guenter Roeck <linux@roeck-us.net>, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

On Mon, 24 Aug 2026 at 15:35, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
> On Mon, 2026-08-24 at 14:26 +0200, Geert Uytterhoeven wrote:
> > On Tue, 28 Jul 2026 at 14:52, Andr=C3=A9 Draszik <andre.draszik@linaro.=
org> wrote:
> > > Add symbol size for kallsyms symbols that can change size so that siz=
es
> > > can be determined easily without having to manually calculate them
> > > when inspecting the object files (.tmp_vmlinux?.kallsyms.o or
> > > .tmp_vmlinux?). Without, the assembler records the symbol size as 0.
> > >
> > > This is primarily useful as a debugging aid in case of linker errors =
as
> > > part of link-vmlinux.sh, and because symbol size doesn't have to alig=
n
> > > with the offset to the next symbol due to padding/alignment.
> > >
> > > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> >
> > Thanks for your patch, which is now commit d6bf11a7e8a86135 ("kallsyms:
> > add symbol size for kallsyms symbols that can change size") upstream.
> >
> > FTR, this commit has a huge impact on kernel size, according to
> > bloat-o-meter:
> >
> >     $ bloat-o-meter vmlinux.{old,}
> >     add/remove: 4/0 grow/shrink: 0/0 up/down: 440264/0 (440264)
> >     Function                                     old     new   delta
> >     kallsyms_names                                 -  324543 +324543
> >     kallsyms_offsets                               -  114424 +114424
> >     kallsyms_token_table                           -     849    +849
> >     kallsyms_markers                               -     448    +448
> >     Total: Before=3D5085496, After=3D5525760, chg +8.66%
>
> I suppose the reason is that before the patch each of the above 4
> symbols' size was recorded as 0 in the ELF file by the assembler.
>
> With this patch, the assembler places the actual size for each
> symbol. Hence they appear to have grown, but in reality they
> haven't.
>
> Looking at the delta between each of the symbol's start address with
> and without the patch should confirm that, too.

Correct:

$ diff <(nm -S vmlinux.old | sort ) <(nm -S vmlinux | sort)
--- /dev/fd/63 2026-08-24 15:46:29.404049009 +0200
+++ /dev/fd/62 2026-08-24 15:46:29.404049009 +0200
@@ -34748,11 +34748,11 @@
 0045884a 000000c8 d decpair
 00458912 000000c7 D linux_banner
 004589dc D kallsyms_num_syms
-004589e0 D kallsyms_names
-004a7da0 D kallsyms_markers
-004a7f60 D kallsyms_token_table
+004589e0 0004f3bf D kallsyms_names
+004a7da0 000001c0 D kallsyms_markers
+004a7f60 00000351 D kallsyms_token_table
 004a82b4 D kallsyms_token_index
-004a84b4 D kallsyms_offsets
+004a84b4 0001bef8 D kallsyms_offsets
 004c43ac D kallsyms_seqs_of_names
 00520100 00000070 D stop_sched_class
 00520100 D __sched_class_highest

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
