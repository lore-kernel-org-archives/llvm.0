Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884D941C78
	for <llvm@lists.linux.dev>; Tue, 28 Nov 2023 17:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ie28Oy0s"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-54b0073d50fso5758965a12.2
        for <llvm@lists.linux.dev>; Tue, 28 Nov 2023 09:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701194344; x=1701799144; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6sdNoskqMew+HpExOfScjyA4mWrsG/qt11aXDDvMoFM=;
        b=ie28Oy0sfOt7TJ7Un9ZsGwR6yYu/JtkcXZ292ZHc51lSXniis/g+AjSJZroeD+DXwr
         m+Kr+ExNotF4DkUfJ+uuSmnV22Oa4fCo3SK2MiFusAeoAXaiqdUh3pxHvi/XRfqGnDNL
         LXUiatIDlviq6WJjDn5eHBSJE7Ocn3K5knBoKH2jyrLY6bHx0Fek7c6nFYqNbrdGGKOA
         1mWFfsyzc4xUu74SOmD3i348inpdSRrUbVCUVArIBB9PFsj2QCqyHVw2zDAC/6mTyD6W
         0ocZvLLYBLRyGhFbToBmUcB+ttWA+GUBdrg0duYAxMy7DLj5SywjMxBUMtpxSlijBfJg
         EhEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701194344; x=1701799144;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6sdNoskqMew+HpExOfScjyA4mWrsG/qt11aXDDvMoFM=;
        b=ktExY5WaHnirvPNl5BDKdILyHWKxbqFOoF7Zds/jLuPDSJiuFyfNnD56L6ccDcx1uP
         +gFo2Jb1vB2Z2D36O8z6mA/33sfk6LDHb2/0gXhQDoo9CuGcmloNddoii04PhM8oFUEG
         Vk6v0Ed3VQbr5Lc6VuS8vQPm0lk0Y7N1KfU0sM/kTK/lhPmJqF/Kr3ZK6tD+tLLyW2G3
         xkb7h7uMxpel65a1+CIbsGRgRTStEzfPVB0/xG+oQzZh9rny6zDkisaWAeIgCq+fiezy
         uy/1j0My1EnfAwoFdhFwouLNlR951k43p3O+A74aJZ7CZoPDFPL5lrmchEZBmdOIR1tf
         2qXw==
X-Gm-Message-State: AOJu0YzYK3vmwEX0u0Kk3+DLA5Au6vhyVzr+c5xrDOxDqfaBzbm7NhtZ
	1Z99D+pa6Idx9yEeVqwz6FE=
X-Google-Smtp-Source: AGHT+IHcpvtkJ+/6Ab8l0lMASvhL/2FhG4i1AyR4GuDleSu00vZSOO7uh9rtEwq21nDBa7iakhIbDQ==
X-Received: by 2002:a50:d55e:0:b0:53d:b839:2045 with SMTP id f30-20020a50d55e000000b0053db8392045mr12185509edj.25.1701194343503;
        Tue, 28 Nov 2023 09:59:03 -0800 (PST)
Received: from [192.168.1.95] (host-176-36-0-241.b024.la.net.ua. [176.36.0.241])
        by smtp.gmail.com with ESMTPSA id eh9-20020a0564020f8900b005486f7f654dsm6617724edb.7.2023.11.28.09.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 09:59:03 -0800 (PST)
Message-ID: <20c593b6f31720a3d24d75e5e5cc3245b67249d1.camel@gmail.com>
Subject: Re: [PATCH ipsec-next v2 3/6] libbpf: Add BPF_CORE_WRITE_BITFIELD()
 macro
From: Eduard Zingerman <eddyz87@gmail.com>
To: Daniel Xu <dxu@dxuuu.xyz>, ndesaulniers@google.com, andrii@kernel.org, 
	nathan@kernel.org, daniel@iogearbox.net, ast@kernel.org, 
	steffen.klassert@secunet.com, antony.antony@secunet.com, 
	alexei.starovoitov@gmail.com, yonghong.song@linux.dev
Cc: martin.lau@linux.dev, song@kernel.org, john.fastabend@gmail.com, 
	kpsingh@kernel.org, sdf@google.com, haoluo@google.com, jolsa@kernel.org, 
	trix@redhat.com, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, devel@linux-ipsec.org, netdev@vger.kernel.org
Date: Tue, 28 Nov 2023 19:59:01 +0200
In-Reply-To: <ed7920365daf5eff1c82892b57e918d3db786ac7.1701193577.git.dxu@dxuuu.xyz>
References: <cover.1701193577.git.dxu@dxuuu.xyz>
	 <ed7920365daf5eff1c82892b57e918d3db786ac7.1701193577.git.dxu@dxuuu.xyz>
Autocrypt: addr=eddyz87@gmail.com; prefer-encrypt=mutual; keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2023-11-28 at 10:54 -0700, Daniel Xu wrote:
> Similar to reading from CO-RE bitfields, we need a CO-RE aware bitfield
> writing wrapper to make the verifier happy.
>=20
> Two alternatives to this approach are:
>=20
> 1. Use the upcoming `preserve_static_offset` [0] attribute to disable
>    CO-RE on specific structs.
> 2. Use broader byte-sized writes to write to bitfields.
>=20
> (1) is a bit a bit hard to use. It requires specific and
> not-very-obvious annotations to bpftool generated vmlinux.h. It's also
> not generally available in released LLVM versions yet.
>=20
> (2) makes the code quite hard to read and write. And especially if
> BPF_CORE_READ_BITFIELD() is already being used, it makes more sense to
> to have an inverse helper for writing.
>=20
> [0]: https://reviews.llvm.org/D133361
> From: Eduard Zingerman <eddyz87@gmail.com>
>=20
> Signed-off-by: Daniel Xu <dxu@dxuuu.xyz>
> ---

Could you please also add a selftest (or several) using __retval()
annotation for this macro?
