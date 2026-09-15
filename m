Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA594A2067
	for <llvm@lists.linux.dev>; Tue, 15 Sep 2026 11:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789471807; cv=none; b=Gwxugwqa8jnhnzTbXwHFEwnyg7DV639Tpw1fGpuVf0/kMxgFXVMWAisceCrUos63oD2gX/3QtSTbXyRJZWj+cTfEfnmxjDfXlYZcLokEw9+aZU7F+NspoPZGEZVuBMC6zDTLkEysgnyRsHGKGpicYj4BOgYhWJN6p5tk9NBMTuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789471807; c=relaxed/simple;
	bh=APKTuDGLjMsk92bnnkXJ0rRlkzi8IPJqTj2KURSVBU4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jkqhMaeAaQKwX0FFw5xTC0peybIA/6iP7gcCGZt2rUusA295R+zLvhgvXafjxYZMtZQ7jxhaNOKLogVRFraP8UOsQbwpnz+AuZE5K0BAPg1ITBk9rU/Y3bNAn3sziTeKKuTD0OyOG7BRdH0YjuC6hjqKfpwEh7birG/vCxT4ZAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PntCrVC4; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PntCrVC4"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-495437bb891so5802185e9.1
        for <llvm@lists.linux.dev>; Tue, 15 Sep 2026 04:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789471803; x=1790076603; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dGOErKOPioTgO3v0/s/JdPfHHqPEsYrQAaTIvwRdmxw=;
        b=PntCrVC4wI8+zdI2eaeM28ZbzEAWn0KkH28dnf1cIiEezXMwUythSmuBXilgbeSFO1
         liP+8h8Ue/UYH1dweeSsI8VIkKvnn+ultUjqtzFPFACE/q3AAWi//tzeg94OzKUBQ85w
         CdfujJ07aL9/3k9kRRQapsnlauGjyNYv2VHgb51aeiePGqnx8ETRC6XR4EGHir/J0YmH
         eBq8hVEUHH8nrnGNDu+YXUokKJWS7ggcoGwiIFCKWmCcRyUHMpQeelSjE1jIZKqsKAZw
         1k9joiU0nPAQ6FKmumv6ZWRnSaryj96GV12eo0wWfUSHLQzBm5ExvOjGUzzugOwiGkdt
         rmxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789471803; x=1790076603;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dGOErKOPioTgO3v0/s/JdPfHHqPEsYrQAaTIvwRdmxw=;
        b=S4BlJelzlB+zTp5gWjW6DFQldENbUxe+Nj5yeDTcILlGV6vkic838KunZF65hVMFh3
         NDVa2YOg2TSbcKIKh3hCVU+asOZN5V30jSasMimhutael+TPa2/iK300b5T93nL+vqKM
         j5YdyE72N1s4XOaA/hrcFQL0jVElEi23Sv2vjLr6Lt+UZIwec/zj4q3v+PxMcRvUsI0i
         MNn6DXMM1wBGrdaqIwqCmRVj+JE8LLGhMS1rwaRBDEqEdFWmNDhbGiY7kneovYhBjvUw
         zd0fkZzcLzgJGdfF2ZE1HZ8U3bWYXOLcV6NDGG1RgYsDSFYHa8F3KfT8RGJGSPRePHNz
         NfGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXob55deZgtT8sN3lk5Ta72Dbv3AuXOcRZ8ynvtNnOqEecLD6hzI2WgN0/+vLN5XeOZe/q@lists.linux.dev
X-Gm-Message-State: AFuF++mF/nMBdzmgFd4IItZAIqRP3HBHUSxPQccg/60wUcTFl/lThTrv
	SFU/sdBqgAqhmUQju00bStneWaD/SXGAlHWwAoZYxE0LnSfENgTqhADV
X-Gm-Gg: AYBFou2dW6mp0c20g68b/yfUUFFGFbS6lfQ4KOHnCf0ovQPNd019ZD0yf8YHy/HWDPp
	cRFyYas2bSddbowVDY9HDB1tjo4ScDR6/PcqafAEulWIorZYuUB6NSbungMMBBJ1ionjPyeGUfv
	BWmYmhHhKNgmm0FMSfPr7DKFmzbJXabHtio/cGSl6Bt23b0wSHPGrHYwuCgoQBnUYmEWvWtoAB+
	/veUSBy0ttlnyv0x+RePFM9sm43X9LXgqAz5SlNywYxJk5z9OJMntjK7q7ctXpLDJI+ojbAWydR
	S46rmMz+wqR2pHiJWB4Fgx0/db01oo4HIayCytCXC4G3qlPbe0POTqRv68SRvLdw0LEgiujWtvF
	87wT4v+bfle08HMJsWKK3bbuh8zOPETAw4pFP7SgtoxZFvoV6WbJBZzC2X3plAVAz+yZuvG9zwv
	0sFQrsSqw+svr9x2vKC2K+bHsnN2pCqjI7G+0nhssAEZpZwjGIIyYyKPUZ0g37+b31YqGzmNH4X
	iCdCW56lGVGUonfYxvBctYVoqmGuF7nw3bC
X-Received: by 2002:a05:600c:33a1:b0:49d:28b1:260d with SMTP id 5b1f17b1804b1-49e7d74ce16mr30558965e9.12.1789471802734;
        Tue, 15 Sep 2026 04:30:02 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32d3c7sm31448164f8f.10.2026.09.15.04.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 04:30:02 -0700 (PDT)
Date: Tue, 15 Sep 2026 12:29:59 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt
 <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, Alexey
 Gladkov <legion@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, Ilias Apalodimas
 <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun
 Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?UTF-8?B?QmrDtnJu?=
 Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir
 Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, Jonathan Corbet
 <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, "Gustavo A. R.
 Silva" <gustavoars@kernel.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, Jens Axboe
 <axboe@kernel.dk>, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 17/21] objtool: decode instructions and resolve
 branch targets in parallel
Message-ID: <20260915122959.2348bf90@pumpkin>
In-Reply-To: <aqkR9Xqu-0Tem1zm@gremlin>
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
	<20260914-build-speedup-v2-17-39817ec5db23@kernel.org>
	<202609141112.F8983EE9C@keescook>
	<aqkR9Xqu-0Tem1zm@gremlin>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 15 Sep 2026 11:09:25 +0100
"Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:

> > > +static unsigned int decode_threads(unsigned long text_size)
> > > +{
> > > +	const long nr_cpus = sysconf(_SC_NPROCESSORS_ONLN);
> > > +
> > > +	if (text_size < DECODE_THREADED_MIN_TEXT || nr_cpus < 2)
> > > +		return 1;

The text_size check ought to be before the sysconf() call.

> > > +
> > > +	return min_t(unsigned int, nr_cpus, DECODE_MAX_THREADS);

Why min_t() -  you might as well make nr_cpus 'unsigned int'.

> > > +}  
> >
> > No, anything using _SC_NPROCESSORS_ONLN internally is wrong, whether its
> > pigz or objtool.  
> 
> Why? We shouldn't cap a 4 CPU box to 4 CPUs?

You almost certainly don't want to use more...
(Unless they end up waiting for disk)

> 
> The idea is that the empirically obtained 16 core limit should naturally be
> capped to the number of CPUs.

The 'empirical' limit is very likely to be system dependant.
There might also be situations where you don't want the build to run as fast
as possible because the system is performing other workloads.
(Not to mention if you have had to add tracing to find a bug.)

> 
> I guess in a world where make hands jobs off this could be dropped, though,
> if the complexity there seems worthwhile.

You need to pull tokens out of the make pipe :-)

David

