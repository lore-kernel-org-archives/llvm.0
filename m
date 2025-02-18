Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E4E23C8BF
	for <llvm@lists.linux.dev>; Tue, 18 Feb 2025 11:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739877294; cv=none; b=T7FGD3lHIEFqajsiSm6u5tbhDQnD/CKC15gGO5ne3W4IUnT7FBvlZ/DPnPlSZWuaBOwK9tPtLhTVHLGY0mLm1sTCrDpstJQ3F12a1TSBv+9O/9Kx+2RqbYLb7iLIGxsEu9eQscshOfav1qBipNO0b3kRx6J5NDscsKMZ9dNcN0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739877294; c=relaxed/simple;
	bh=e4ePEsIFIVWnVVp7x965KwnUxkPN33NpLp6ekCRE8KY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XpJOXcgdCjsLUkDniGN9af2KljAFY6r5EhsKb/TJlvNHvfgqv7YM5L+7Vr1nZ2VWICMK8d1zE1sYfKhgo/O/iiIfdRSYQTxiPn57Rtr9RFnJ4pTgULycR/AFWf0a3HXaY7zif+AmVHESXozxgeRVxDGycJzarmrqZtia9D6xxI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ty/X8o7K; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ty/X8o7K"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6e6698667c7so46772186d6.2
        for <llvm@lists.linux.dev>; Tue, 18 Feb 2025 03:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739877291; x=1740482091; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e4ePEsIFIVWnVVp7x965KwnUxkPN33NpLp6ekCRE8KY=;
        b=Ty/X8o7KECFl6zLUz6vUwjkhNcz1EQl3VJBMWQqK0xa1POcaKIpQE8d7UISJY0SwdQ
         XbRq4uJzKhwC01Z6gTbGqhJcaV8u0BpqIvaiuPuyzE8ljjNWOiK/OeXCgrdjemeYNa3Z
         +MQ37wpEZbrIGBxHencP4c4Mi5cB4DUqTGpweo8K6lyAFuOAj1S62JMZveT8+ptNlAyV
         QOjpdo7O+x6Q6aqrXOKtoyWLTJPxOC5M7Gta94UHpZjDlqoew/7gKYQQ+SQ0GdGEhe9D
         DaZTGRJKgxr3aclxr68IRdW9lrEXqgj0jqcI8f74Cag153mm8K9ZK8NmagUhcSv0pq91
         X3rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739877291; x=1740482091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e4ePEsIFIVWnVVp7x965KwnUxkPN33NpLp6ekCRE8KY=;
        b=AaFu4ClVz42q3MoIvJkLxod6Kcl5SMwgCawkuVPgfztE5XRQO44lUqpD/KVzC66zJ2
         MhUSdpEsO+R4xuDvYZ1Qlx4KGuFdrpIe1+MSvM9YS9aEpLd6vTh3nIJmikpIdWHg5Y0S
         3/JL6+qpFWe4611zWyR6BY/IqyKcbAVNdoWAeWhaaCfdcNbt7iKRfhXVAeo4UYe5ba0b
         3uj80mVvHxDi2iBNqIZ23ffqBLZxWE2rstFmMGVqjAQ0OwO9jC+q81QULKea3ACFYpQ9
         BpOB0bkY+JVgtxrIPK+/JuNi0p6u79mtvenvKCPp8uXN+AnOZMI1+eD5U/gb/11VKbH0
         9BjA==
X-Forwarded-Encrypted: i=1; AJvYcCV7nx7LUTDwKFSYyI00ETaNR82RZc5bbXDyLC9hxcboXAYJs22m+Qw64C42IosKQkGbJ+Hb@lists.linux.dev
X-Gm-Message-State: AOJu0YxFbP1xkCp6Ia2HlcQ/bTWeYaeh2sbA9Gghnw7dcWU0y+jkPjBF
	wzToiwtb6DNZc7xfLA044m7AxYgM+YLe+grd113IvhzbcHttjw1W5nkYdLCqquWt9sQ13TRP5I7
	m2NhiTVQjEE7O4vfdNvMz5RKD9Y5X0ODa1slN
X-Gm-Gg: ASbGncumbTWHFQ4rLJxfkXtG2PWC6peTjufSVEtImGaX5RIErS2SSs2CLpCK7j2RUWW
	NcbNrWu4rQ9AedJcFldVob0HYGnFT6QR8t/ejRB0dat7kWuI1kzNLEUcOv7HknLiRLE1RQJ9Fb0
	hwuC1BfLb9TroBP+Bj0TjY+4mc8hg=
X-Google-Smtp-Source: AGHT+IF4V0cacABaV3DRhzrTYfPUh4lhH6DNQ3GhjP7RKVEodS0vVCqDlAESE8r3X5h1S9bFpKdk0ERPYFpqO2C0aao=
X-Received: by 2002:a05:6214:29cb:b0:6df:9771:978e with SMTP id
 6a1803df08f44-6e66cd063b0mr215315016d6.34.1739877291222; Tue, 18 Feb 2025
 03:14:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202502150634.qjxwSeJR-lkp@intel.com> <20250218091411.MMS3wBN9@linutronix.de>
In-Reply-To: <20250218091411.MMS3wBN9@linutronix.de>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 18 Feb 2025 12:14:14 +0100
X-Gm-Features: AWEUYZkW-ELgmmWvEUCGBMqnFptxrYx8irjbyp0U6Ob-IrK0R7M-ystRnmQpahU
Message-ID: <CAG_fn=WzE5d4W1YheYN3SPYmVR5=r74zhV-Zhao5xu-Fqi461g@mail.gmail.com>
Subject: Re: [PATCH] dma: kmsan: Export kmsan_handle_dma() for modules.
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, kernel test robot <lkp@intel.com>, 
	Peter Zijlstra <peterz@infradead.org>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18, 2025 at 10:14=E2=80=AFAM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> kmsan_handle_dma() is used by virtio_ring() which can be built as a
> module. kmsan_handle_dma() needs to be exported otherwise building the
> virtio_ring fails.
>
> Export kmsan_handle_dma for modules.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202502150634.qjxwSeJR-lkp@i=
ntel.com/
> Fixes: 7ade4f10779cb ("dma: kmsan: unpoison DMA mappings")
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Reviewed-by: Alexander Potapenko <glider@google.com>
