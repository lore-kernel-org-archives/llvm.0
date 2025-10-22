Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8509427815E
	for <llvm@lists.linux.dev>; Wed, 22 Oct 2025 04:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761105708; cv=none; b=ch8Xi2cUERoeJNnV9Q7fjAtODSY/pA1KEBk2mTR5k9H3O8YO7S5S3rEKBjGxyuR5pGjhsfDPm1L3biVrZxd8bsxbsW7w4U0CTHbYhzhjcxnjYvDmjm20C8J2JTAPJ5X4RvBFgdsClkDDeoEU4EaciMS1fuP/mZIJdHaOqyUsDBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761105708; c=relaxed/simple;
	bh=9jY3EA5gEkdui7bFU/atDea6tp+oL2Xa05/E1ZXf344=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y8MFG2r8U+cf7ZzkyPJbI9oJHcKqX12ihjtjl1oh9/XOTVuwDHVQ7WfSl5V2NWJX6YpEMGq83CCMudWzxRv85ALws+M7qNazd3lNDaCQOk+E7SCge/dxTceY+nrJR7nBLnP5D0BlFTklQG+XKdNYU+f0soLQfRm2ycsHxizhHuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zs0pzlHE; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zs0pzlHE"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-28e7cd6dbc0so80264445ad.0
        for <llvm@lists.linux.dev>; Tue, 21 Oct 2025 21:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761105705; x=1761710505; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5XEGeI2U2r41+s29akUYCWbcwFKMTqkQOw+6CMAYMfM=;
        b=zs0pzlHE+jRH0ZyQK/f0D5vGmOmUrujSJfkDLrB5F+C/dG7oTwbjj65zKvC/CHqB7C
         aUdCZY+0JF7022aeSs9sVwXgMBYdAc9XvW2IhR+UsHlz2U3o7nd9468yHiuWqmFH6t/5
         ClVM/sV6DbsblTF6gOSfb+OfTeC2KUN1m/6D9/ygYie43QeopGcYQbOGwzJqy6k+lKc+
         KFEe9b79eAbCgoJ7i//RwBdHjB7pj2bdiwr4ZYMlu+uBP+LG2OdsLsLSi00LktCPaQpY
         qhWv2v4lW14usz0K+qyYbeLRcbWDnrJpCw+RTjVUyN6Suxqbet4XDM7CjQE58aW7dPxz
         qNWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761105705; x=1761710505;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5XEGeI2U2r41+s29akUYCWbcwFKMTqkQOw+6CMAYMfM=;
        b=orVLo6IsP7EzQKHaRROuedxWQvmKvqhH/RyicCnDqg3roxW+FdlivELS0rJY+2LVkm
         clq6PTNSVQQ7dhpGFq/plCoD3Wtofwgj16028avso0e8X3akNBpK0u+vhW+hHPmQ8X0L
         p+b8bsQpD/rFBhY8lQ7o5xrvpoNskIbtDAt9Tee/bGGnipu9pfm7lH1AMZs7sVO2sNjG
         eeVyOn9g8JnUqa/A53Z56K7vswCqml4JtoeP9wLYy1aGV809FjkUx5d4rZjRXbNKYW0I
         wO+RJzs2wWV0Uo58sib9SD4UJXF+uCbEihiONKl6aTCrzZpo0y/dAYCjqTOqGP5vTkEc
         GOPA==
X-Forwarded-Encrypted: i=1; AJvYcCU1l6SYNdo7eIqcuYy8WuJbTQGd7euyM/w6Fu+zNgoOP5zb9S1iFYEsWsSgGE8oHOHxeoG4@lists.linux.dev
X-Gm-Message-State: AOJu0YxERwHousX/+F2A4SAN1uv3X4S0qvKB78gCHwe86BNisRlvNxvX
	DcXWW60g3vtqexdbD4MYUAB1y8/ahavC183FHy27ZHtDQ0EwJUgTpfD1QO6+YgYOScQ=
X-Gm-Gg: ASbGncslS8BuTqC4JD25TfR1QF+pxpXDh9YNEoJmvJf1aSe35rhlsDDyvbfbYULy+4+
	IXCs8rm/GpHWDaLpL4HWXR7eW0yGG/T0zMexjvBVSiNGHnkN6Hq4fb9Tx2JMxKqN1LmZhU+bOeg
	BK7z+5kGnDxaUkfLE1nPLT51LR04rWUs6PSq4W8MZCUt5GvBmZYehvA/M5F9z98pXdSEcCsULAP
	xfAhuhoU8Mnp5++dOfJx4b029kPkYq6j4BX1xS1XGA+64GiZo5KPgH6VJPkQzPcHIiUoWQ26v8T
	5JpSuh8dGppuS/w+CMdw3hE6QfifJmxfu9O6cDqAhLcILqIZMJ/ugNXzDfB0MFGgMXAla5A/Ez3
	kYrjMB3cmO827R/vXZBH8b7dmZfZtjZFDYkAcR/KVbjrQzffEXIXw9yHZP+U/JcaDChHeIpng70
	txrARonUDYuhUU
X-Google-Smtp-Source: AGHT+IEYWTGPLkVLKAMGZYnPNOk1bG7CyHUMxRahoDXL1MDVvSzLtlyzXLVhQRT4L6q1WhaGPTRqNA==
X-Received: by 2002:a17:902:f70f:b0:290:2a14:2eab with SMTP id d9443c01a7336-290c9cf8f2fmr233326615ad.11.1761105704778;
        Tue, 21 Oct 2025 21:01:44 -0700 (PDT)
Received: from localhost ([122.172.87.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292472193acsm125225365ad.108.2025.10.21.21.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 21:01:44 -0700 (PDT)
Date: Wed, 22 Oct 2025 09:31:41 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Christian Brauner <brauner@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Arve =?utf-8?B?SGrDuG5uZXbDpWc=?= <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Jens Axboe <axboe@kernel.dk>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, 
	Breno Leitao <leitao@debian.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v18 11/16] rust: opp: fix broken rustdoc link
Message-ID: <bjoulx2acrfpnqmwmnamunihzuaakyk3i6m3gvtcxklssmznt2@azfbrjhiedi3>
References: <20251018-cstr-core-v18-0-ef3d02760804@gmail.com>
 <20251018-cstr-core-v18-11-ef3d02760804@gmail.com>
 <gcdcwpotzidrksmsnyvesnojcylbb2fqpiue4fijhj2cmayli5@7lpyessslxka>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <gcdcwpotzidrksmsnyvesnojcylbb2fqpiue4fijhj2cmayli5@7lpyessslxka>

On 22-10-25, 07:57, Viresh Kumar wrote:
> On 18-10-25, 13:45, Tamir Duberstein wrote:
> > Correct the spelling of "CString" to make the link work.
> > 
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> > ---
> >  rust/kernel/opp.rs | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

I have instead applied this one now. Thanks.

-- 
viresh
