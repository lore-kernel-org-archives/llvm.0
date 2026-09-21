Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C1E49AA59
	for <llvm@lists.linux.dev>; Mon, 21 Sep 2026 12:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789994200; cv=none; b=OowT7/cOuq9LnoTvgbkbdV6aNJzTSJswjwESQ/Dr4DSRVG1Vs+xLWyjlH0mRdTgUoCpGBqieUju0d3Rm/lznPUxy6ra4xrWeYqkUySLxAJpzId5w/FrE3BPa93pAMe6lkQd/R0AWBSEzn5WJCDrj0v9qIoENSosC4RiWmkU3Il0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789994200; c=relaxed/simple;
	bh=mbYQBjqI+FvjSHjgV1FgOANO3gDLaxDS3IAWnqfDmCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HlFCH+N9KJbCKZuYcdDCdW3PgSSCG2ofRI3qAWS6MjJ4mzYK4pnSXUpxVranwKrvASHl9/m83AIvLcj/1FTPWkuW2SothYhZ49wRUpKtixucRicZl+uwyZZMqzBCMJ3r+hW7+zMc7GZ+uyUzy8qEvjMh8osuDH7I7Pq15ABrmNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=OpvRhi7v; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="OpvRhi7v"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso25462125e9.3
        for <llvm@lists.linux.dev>; Mon, 21 Sep 2026 05:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789994193; x=1790598993; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8SRT9W/2z9fLq6Pj3t4dd8eEawuNLFrl/C3bQijqfHo=;
        b=OpvRhi7vGgvinyHXtfb/pke6J/DOK2NFIlGmfNocy/MiEYrle1AtHQmXMgC2mYfwbr
         ZD9A738j4K/wawIg4k7qrzKf8THN3jycmYiRsfG3yV/zJqO82YQdvtddZtu27nqQ9hqQ
         fUsgw+bel5/saZz2BmO9Z80aFxwynvWwgplZkMumH1fd3RTude2MHT1SSozkIDR1zhuv
         gqVFtFXyzY9ozeh4D/aqr5ERXJyIayiT+l7qy49omn/RJYBxRT9AmPA/s6Vko2gW5UXp
         YzibTqjQL4ipgVzOHnkxLGvPBcLl+Sp0HVHGWfOP/+TbNe9+d515xBLVHRIhq4PvxEj5
         8eAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789994193; x=1790598993;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8SRT9W/2z9fLq6Pj3t4dd8eEawuNLFrl/C3bQijqfHo=;
        b=VtS8+tX8S07DbaQN0BaDPUul/+JmJBS13Yzc/pqYVnfDYZsM23QEQ3OdcKzqVdh3UN
         9ifmhbREIC6dv65baCdoTtpy1vLe24h9L7p5oTSpt8eflRiVdJTqwJ2SBGxtkz6e0UlO
         +Dnjg2aKRokXr66EmUCg0I2i8zwg5sjAfxJ+dMTn8QLUSgrbddQI3owZnqA3yAwDJ/is
         rTMB1cG7SkkAzGE+mwXcZs7mmeVhtM9EeuGokBybHPdcyzR2obnY2dU65uTJ+5Ue1zq3
         yjKMZfPwPyRlmmJbjvUt3X5MO+1JqaF5Up01RIo22fAcdU3X5Q6gCUZm9GIFsWazCLol
         6tTA==
X-Forwarded-Encrypted: i=1; AKwUvBzZEcNdQ66LQZpntRwzYWw/uy+K3nL5ieHcCHyBwTY9vNKMohJ/srzzBxLQK9dg4/lN7/1u@lists.linux.dev
X-Gm-Message-State: AFuF++nqHQc6YqAP13LvuACahtGyRmAf2Z2qFOh2IRVrrijRgteFM/A9
	gPXe2eMul8d9cMGfh4zbuIZuC/cttlH9VaX0choOUFQnZL/VVpU2T6XO5fqf8Akpgew=
X-Gm-Gg: AYBFou2BAzdXyt5SAdtz3bn+7IMfqDqMs8ty8AO5K4MRPjha+dgQ5DLdnvES8+9MklC
	TGLG/cIy5WN2XwZ+6kdBlwPlvpJZJlRqJBOzt0G3dTLNRqDZ5d96B35/jhwxSHnP+Lx1cBFm4v4
	QC6lluFn9ppramwbgh9ypHzmVg+AYZcPFINeHE18FxpLZwszE2/9DG+XCMM+LpJUp8lAWSJ9B6F
	+p1kB3lLt9gcyrPZwvJb1zwnRN1CNxZgTnyPqzSVQuLQWiSf50LCRgl91yfVRs5NOq1gztQ1pu4
	Mkc1BKYWyhLSjCXjlG854JsMGm7NnfMx/1UDwg3KjgfdhYgdu/kxwgD7MQF3/K5yaAsjC5tMnMQ
	I96GdPD1FFIyLiCsfF4tHAcBwoi1kiio9XfGnNxcobkv38VKm9PQxgLxxsQoIGeaseY1Y2EL/Oq
	r0tgtz42c6mNjfqjlGaQg6XV9UOZPdxVL7lxMWwNXTKCexIQZLVkIG2ghyp1fnkoZiSZ/MsBjgg
	6D1RxuMMO+peyJgt85lVwAmH1JEqWiq65k=
X-Received: by 2002:a05:600c:46cf:b0:49c:de80:b833 with SMTP id 5b1f17b1804b1-49fc5687b6cmr159289905e9.2.1789994192617;
        Mon, 21 Sep 2026 05:36:32 -0700 (PDT)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724460753sm23342442f8f.10.2026.09.21.05.36.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 05:36:32 -0700 (PDT)
Message-ID: <2b27bb4b-47e3-45ed-a26a-4b9de2b20542@suse.com>
Date: Mon, 21 Sep 2026 14:36:30 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/21] modpost: emit module descriptors as assembly
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 linux-hardening@vger.kernel.org
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-13-39817ec5db23@kernel.org>
 <95baacfb-d8d9-4d2f-bc89-592df6f6f8e3@suse.com> <arEZrFmXeCO4hZpP@gremlin>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <arEZrFmXeCO4hZpP@gremlin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/21/26 1:57 PM, Lorenzo Stoakes (ARM) wrote:
> (note there's a v3 see [0])
> 
> [0]: https://lore.kernel.org/linux-kbuild/20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org/

Thanks, I missed it.

> On Mon, Sep 21, 2026 at 01:25:09PM +0200, Petr Pavlu wrote:
>> On 9/14/26 11:22 AM, Lorenzo Stoakes (ARM) wrote:
>>> The sections were confirmed to be byte-for-byte identical to the C version
>>> produced - each of .modinfo, .gnu.linkonce.this_module, __ksymtab*,
>>> __ksymtab_strings, __kcrctab*, __kflagstab*, __versions,
>>> __version_ext_crcs, __version_ext_names and their relocations - for all
>>> 8,135 modules of a clang allmodconfig build with CONFIG_COMPILE_TEST off
>>> and CONFIG_MODVERSIONS, CONFIG_EXTENDED_MODVERSIONS and
>>> CONFIG_MODULE_SRCVERSION_ALL on, and for a sample built with gcc.
>>
>> Lowering the data to assembly loses debug information for __this_module,
>> specifically that it has type `struct module`. It might be worth
> 
> No, it keeps it - every module includes linux/module.h, and the extern
> declaration of __this_module carries the type, so all of the stuff gdb
> needs (e.g. ptype, p & field access), DWARF etc. is all there in the same
> way as with .mod.c.
> 
> Have confirmed locally.

An extern declaration alone shouldn't cause its name and type to be
included in debug information. They should appear only when the variable
is referenced by some code.

Testing with a simple module that previously referenced __this_module
only in .mod.c and in no other file, such as lib/test_module.c, shows
that the .ko no longer contains debug information for this variable.

I've verified this behavior with GCC 16 and Clang 19.

-- 
Cheers,
Petr
