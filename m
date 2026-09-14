Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0299041D12B
	for <llvm@lists.linux.dev>; Mon, 14 Sep 2026 21:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789422292; cv=none; b=V9gwn6hjVdnpZGTTH6krKewHfAwd/lL9VMvUbz7WugyLjMoTgCDMbN/QUVYnMmGxp03MbG74psZCvLphCsDRX6pGnxHnPEGDu3Etu1Th6BMWjQKA4LorrvpCt8p/YjqknH9n2wWpG09tVc+cEUbNZBIk8ishXQed356CTRxoplc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789422292; c=relaxed/simple;
	bh=jq28sXgMOG83pqsfn4DsTwpWb6M2x0VMwZWrEfMyIQw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AD+06ze+9Z8r09YrwvJj4weZP2fiSWOPTiH8ZSjPu7cOJwl9+wABVduYQxxF+LPVgkyI2NFrJNEKu4ZisGcCI7plfV5Srrg1TdNCggRp66P9NEYV+O9ZHmfAOcwxwGTuIdlw5FAwQylb7F/bWhGovi0cxu60dSBHH+HKPTgeSEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bOtyo7cK; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bOtyo7cK"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-486fa798933so1815915f8f.0
        for <llvm@lists.linux.dev>; Mon, 14 Sep 2026 14:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789422288; x=1790027088; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MMWuFoZNpTbVauKFWQOZe8Q8+oQNvVLrh3IMG7Y4F/I=;
        b=bOtyo7cKHh0CkB5ddFEp/B9ek8NXbwHK71RyzzxVyp4laD1HO/dZPr0Sdeh4VUCev/
         UCTkSpPMskRCM+BJkLauROqq2T5AYTsl4YmmEt/HVV9ReY6z97hs61u2kirZdEqbLdlF
         oDgQ8z041TxYl0/tfhzZT17nJyYkOrOvaaUXaqjTw3CteMUoF8N2zkesseymZykSYev0
         ZtSs0BwHPFA3bA5m/+J+5yd4hnPtYVrSm20/BDTRhJkRxi1eTDEkQslJJlNrLyWejWI/
         i0RuR1gcr5MLjElCkCVcgTPZHDzx+V5spnqxesi0soMCxPaEYok39ARVHtI3FhChLee6
         OmQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789422288; x=1790027088;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MMWuFoZNpTbVauKFWQOZe8Q8+oQNvVLrh3IMG7Y4F/I=;
        b=xtH8ipt0YF5YyUSX1z9CvLbPfWnPF7sgoelvv3CtnbfAssXuT1OMxjfLlAelq44HCB
         LfuplGzbeaLbOPpqYy9ILFysMjbPThun1oaAfq6DCcKEnWi4vwqICR3galwikNTli3Zx
         +5KOwGGDSaT3sLy8JXflPtFPekShXuNtdZouqn2QtrS4mucopQMcfkOXssZ7kqqjLdDC
         e/JdXXS6vQvzuijbb94R69H+sl48JFoFYww416IjXMi3H+MARPU+ymPOggjlZuenaitM
         D3jFQtjgK5bbBT8jDjF/yzpuA0afrjfAV/VNr0MM6TdhR3zH00kQnBO4SEo0+RPG1zr1
         n4sg==
X-Forwarded-Encrypted: i=1; AKwUvBwbeIQYyWOEbLOqSBwBKUGDWltngiAeDJT5P+DwT9s/z7QXYsRMIJw01en/tcZbfxgKYuz2@lists.linux.dev
X-Gm-Message-State: AFuF++nEGY4AFBwsaJlio+hJneMKYLc7wJEGj7YO1PbFu+Ich+XiKz32
	f9/2dX4S31bQ22Gy4NriZZYyaAyVKE+agK/UmdSwinOClFKwpmOxJ4Tj
X-Gm-Gg: AYBFou1EKg64+xLqOafQIbDSmVDkxbe0IPVhXsepYqlGTQ1E/IXlkJmriokrRk053Xb
	nVqDayBZhK7yZN1zzQfTUlqZj2KAaYF9kd7OHinlGtwWDVElO/xbZowBwvj0bfzlEP9vXnEt7Xv
	G7CnyPPTllEbI81RWmD240EzszziAHnH9DXD8nMyetX83wiP1GTMtqtk+9lXttv2CMKmRlLPP6N
	VjR4wLDrFHIHbp0jRsn5rjM/h4jCrMeV+gl+WVGTYHLfms4TVbpsZGb6CFbTwPrMan2Qoc9MM4B
	apTSkHzlxjTHT5Or18C5zngNdGZ2JcOq34nUiSK8FwAze1E1EfkUhWUjwJI8Vk/zSABuHYeDOS4
	2zjvxbtvbNlT7JJpPBVq8thPeLilB8MwH/LRh+XKNhX9IqLTjSDq4S7wZrImX6CuE6O+A+4gOQr
	tUPjbHhg7+8JFB4aD347C27wmiR0NB/b8WONHcTOsmUGLx+1xqGuff1VXNpbCKqjyZ4D/qpcPn3
	sdSBdTqXnLx3VqO9+QumiGktgVu/vyhd7Po
X-Received: by 2002:a05:6000:454f:b0:487:36a:c870 with SMTP id ffacd0b85a97d-487036ac895mr3178523f8f.11.1789422288113;
        Mon, 14 Sep 2026 14:44:48 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ed0fbsm29878025f8f.3.2026.09.14.14.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:44:47 -0700 (PDT)
Date: Mon, 14 Sep 2026 22:44:32 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Lorenzo Stoakes <ljs@kernel.org>, linux-kbuild@vger.kernel.org,
 x86@kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Courbot
 <acourbot@nvidia.com>, Alexandre Ghiti <alex@ghiti.fr>, Alexey Gladkov
 <legion@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Andreas Hindborg
 <a.hindborg@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>, Benno Lossin <lossin@kernel.org>, Bill Wendling
 <morbo@google.com>, =?UTF-8?B?QmrDtnJu?= Roy Baron
 <bjorn3_gh@protonmail.com>, Boqun Feng <boqun@kernel.org>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, Dave
 Hansen <dave.hansen@linux.intel.com>, Gary Guo <gary@garyguo.net>, "Gustavo
 A. R. Silva" <gustavoars@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, Ingo Molnar
 <mingo@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Josh Poimboeuf
 <jpoimboe@kernel.org>, Justin Stitt <justinstitt@google.com>, Kees Cook
 <kees@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Mark
 Rutland <mark.rutland@arm.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier
 <nsc@kernel.org>, Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, Palmer
 Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Randy Dunlap <rdunlap@infradead.org>,
 Tamir Duberstein <tamird@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Will Deacon <will@kernel.org>, LKML
 <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-arch@vger.kernel.org, llvm@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Jens
 Axboe <axboe@kernel.dk>
Subject: Re: [PATCH v2 03/21] kallsyms: output binary data to speed output
 and kallsyms assembly
Message-ID: <20260914224432.7ed40d48@pumpkin>
In-Reply-To: <cda4d320-599d-41c8-a37f-827688b552f9@web.de>
References: <20260914-build-speedup-v2-3-39817ec5db23@kernel.org>
	<cda4d320-599d-41c8-a37f-827688b552f9@web.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 14 Sep 2026 22:16:12 +0200
Markus Elfring <Markus.Elfring@web.de> wrote:

> =E2=80=A6
> > +++ b/scripts/kallsyms.c =20
> =E2=80=A6
> > @@ -413,26 +438,24 @@ static void write_src(void)
> >  		/* Encode length with ULEB128. */
> >  		if (table[i]->len <=3D 0x7F) {
> >  			/* Most symbols use a single byte for the length. */
> > -			printf("\t.byte 0x%02x", table[i]->len);
> > +			fputc(table[i]->len, out_bin_file);
> >  			off +=3D table[i]->len + 1;
> >  		} else {
> >  			/* "Big" symbols use two bytes. */
> > -			printf("\t.byte 0x%02x, 0x%02x",
> > -				(table[i]->len & 0x7F) | 0x80,
> > -				(table[i]->len >> 7) & 0x7F);
> > +			fputc((table[i]->len & 0x7F) | 0x80, out_bin_file);
> > +			fputc((table[i]->len >> 7) & 0x7F, out_bin_file);
> >  			off +=3D table[i]->len + 2;
> >  		}
> > -		for (k =3D 0; k < table[i]->len; k++)
> > -			printf(", 0x%02x", table[i]->sym[k]);
> > +		fwrite(table[i]->sym, 1, table[i]->len, out_bin_file);
> > =20
> >  		/*
> >  		 * Now that we wrote out the compressed symbol name, restore the
> > -		 * original name and print it in the comment.
> > +		 * original name for the comments below.
> >  		 */
> >  		expand_symbol(table[i]->sym, table[i]->len, buf);
> >  		strcpy((char *)table[i]->sym, buf);
> > -		printf("\t/* %s */\n", table[i]->sym);
> >  	}
> > +	write_incbin(out_bin_name, bin_start, bin_pos(out_bin_file));
> >  	printf(".size kallsyms_names, . - kallsyms_names\n");
> >  	printf("\n");
> >   =20
> =E2=80=A6
>=20
> I suggest to avoid return value ignorance a bit more.
> https://cmu-sei.github.io/secure-coding-standards/sei-cert-c-coding-stand=
ard/rules/error-handling-err/err33-c/
> https://cwe.mitre.org/data/definitions/252.html

And I suggest you do some real coding...
The error is sticky and can be checked using ferror().
Code that looks at the return value from fprintf() fwrite() etc is very
often broken because the only time they can actual fail is when the
buffer is flushed during close.
Adding error checks to every call just make the code unreadable.

David

>=20
> Regards,
> Markus

