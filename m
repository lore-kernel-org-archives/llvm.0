Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE6E2163B2;
	Mon,  3 Mar 2025 18:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741026110; cv=none; b=W79Np+zzGBRBDv+/2IZslxEP1jpBG8yuy3trtg/h7cKEyuRMMCPfcZCdRSL3rgpRrgKyI/K1BuH157ZEZ5k4SdbL4bKLF1IQnsPQtV5LOHlY/xdVySkIlO9xYkUTXolxrSPx1HibK0k7WYy0OuBh72nHgKFSsbv5Q9rXFfC4ue4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741026110; c=relaxed/simple;
	bh=qQ9RbbHxETfyug0GfVaqoYXTPk0pB6Cyk1KbM4vwpnA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VS1PcqRxgSaNTvmQ5j1lNoAMWVyytD3ivqKQVuH/GJbeUcl5DaWYsP1rVVdLFXIAPyIMGTfPBAf9Kx2BH6JG5EdRcXaDBHDdrKfWaqc00ap1mrn8xF+RxgTNE6AiOAUqEBjO799LWXATunG52jtgdD4blGqRapDloEOGtRLEsCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WUxhCK9Z; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WUxhCK9Z"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c3c4ff7d31so120893085a.1;
        Mon, 03 Mar 2025 10:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741026107; x=1741630907; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HFzZWjcFqsfDxYl0mzTkCHRR3hGJXZp8cboZARo9iCA=;
        b=WUxhCK9Z9YkzvSx+S5/obywZqUr340725+AvODiXIRlyGvDZt1rnpknccC3j/rA+/H
         zqYmL1xiLObEKbVCutkAuTLhfwc3DSfRBCUo00fuYoNPUQhopo5UNfvwZq6TZwXY6N90
         6JfAWZKKlxXd/4dehWQ1myT23LuseVA/+1CX3OeAib1ph9Z2G0AXyLJgIhMIEFsl4zmN
         rNdf8bXknBj4xyJ/tEqKy9S/vnvBzzLtnJlakCk6LVt+iMrGAnPMnvWGc3O4haFIsTFP
         iGTtNEZAeFIDTvYgNPydQIjAqadHhU7uAuCybQB3DOinLl4zNgFYlYLj3rWzAVp71Ddo
         wbtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741026107; x=1741630907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HFzZWjcFqsfDxYl0mzTkCHRR3hGJXZp8cboZARo9iCA=;
        b=J35r8hXzsehLsBMVaNo9rcslUNK2n7is6tfHB8ECqcvV5lR0jDO06N8ITVE0u/S2mc
         CTbmkDgxTrUXDUH4ZxY0agGPKSFVI/4vCHbbLG3ui8nWkAYaAdVZ1Ysi6zesVNoXgCng
         caaKaKKucmKKzTMlIl+pIPHyIbk8tqU/Ft5dHCcjf7nqkk9nGpAUSNkwr66yBAthLqA9
         8lhfES4tcw/bc9FxZRNF0mg+uQ1kB+hfQIO3LdfzmQBChIbwmqxmzUI3hv7Mf7MzLUHx
         m3RbmjYwZOpjkpmudouYOuwke5lP4GZPqjOP9KLfCbtoSaw6SvYTFyK2WNC0XpU0hp4H
         ++Ow==
X-Forwarded-Encrypted: i=1; AJvYcCXkKe3MKdsknNumU88ujnoz8zVh1Wy8IFnq/6V2UldvjD4AQc2wPT39RYvymOqVT+XnCDhp@lists.linux.dev, AJvYcCXzTsrMjQ945LkrAppQ2ULaeQ5yHSrf2i38w3d0JGCHJAYmXnawvul3nnuv7jMxjjIB+Zibn3jzJSBlyLanTA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz99wQJhmMFnIRSoxkBobxgc5qIUH9iA4OYJ9Khg4ekxGPMxBQz
	IHpAGzJwCQRnTclPMhOc4BMldrrXAWp+Zrmo22NEQAyqR7OOtSUMH1pNyNORKzYgf37VlPNqpSf
	keY63Kh7EUqSLIEzueDdvzi9Mzjw=
X-Gm-Gg: ASbGncsIDGzOd7tlsHrr/wpcdqoK7uYU77tBtkyhl8cSNxqnQsnYsd+eIKDHoD9h24G
	R5qvpr4aDETZfn8Geu5mZgUcBHu88Rn3D1GuU0FH2wVs/OTjPucsVP3ra55zPy/lOEXuy7DHf4Z
	9h1UtkGQ5BhmTltn4P6hbmdZyN9if16OvnP8Ikjm+1Zdnvpgu8rOtv62Eg8Q==
X-Google-Smtp-Source: AGHT+IFzLl7EDIrfRlNRztKKZxawCHfzjGSBK4vOyQk5OfXMs1Mp/lLcfpbA5RL1hdMg34E0AWitNb0abmx0uhun5qI=
X-Received: by 2002:a05:6214:2462:b0:6e2:43d1:5fec with SMTP id
 6a1803df08f44-6e8a0d6d85dmr208171246d6.33.1741026107393; Mon, 03 Mar 2025
 10:21:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250303084724.6490-15-kanchana.p.sridhar@intel.com> <202503031847.j1iReOtf-lkp@intel.com>
In-Reply-To: <202503031847.j1iReOtf-lkp@intel.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Mon, 3 Mar 2025 10:21:35 -0800
X-Gm-Features: AQ5f1Joteeu0OkDzJuqjMB5KRiGMoPyQGJnXPi01TtEkBA2B70o-aPls5I0oWA4
Message-ID: <CAKEwX=MgV22UBNi-2dNBDgNM2DRfrngk_4gO7z9t-O0KrpdPUw@mail.gmail.com>
Subject: Re: [PATCH v8 14/14] mm: zswap: Compress batching with request
 chaining in zswap_store() of large folios.
To: kernel test robot <lkp@intel.com>
Cc: Kanchana P Sridhar <kanchana.p.sridhar@intel.com>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, hannes@cmpxchg.org, yosry.ahmed@linux.dev, 
	chengming.zhou@linux.dev, usamaarif642@gmail.com, ryan.roberts@arm.com, 
	21cnbao@gmail.com, ying.huang@linux.alibaba.com, akpm@linux-foundation.org, 
	linux-crypto@vger.kernel.org, herbert@gondor.apana.org.au, 
	davem@davemloft.net, clabbe@baylibre.com, ardb@kernel.org, 
	ebiggers@google.com, surenb@google.com, kristen.c.accardi@intel.com, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	wajdi.k.feghali@intel.com, vinodh.gopal@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 3, 2025 at 3:07=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi Kanchana,
>
> kernel test robot noticed the following build errors:
>
> > 1166                          prefetchw(entries[j]);
> --

Why are we doing this anyway? Does it have a notable performance
difference? At the very least, leave a comment explaining why we're
prefetching this (although the build error suggests that we have to
remove it anyway).
