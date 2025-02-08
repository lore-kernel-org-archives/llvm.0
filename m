Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB9B157E6B
	for <llvm@lists.linux.dev>; Sat,  8 Feb 2025 04:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738988682; cv=none; b=ryvqbsM9jqWotLl+tf/slhbDVvM+oWes6uo/uNndIK6yuox+nGL7avSDm6yFsiKICLxVAHCU6ddrgl8EXg/OFQGHxo5SMB/dAGK0C8tBINaIkXR5JuB532z5QYHWIklbY16mcC/GfI9yULEe3TIEvyzw9+b41zg885ILX8GXVdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738988682; c=relaxed/simple;
	bh=Prc/mMWgyeTcpEW7eOH68JnK4CoYPdFhpm0TEWAwGug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sOA/0T84bqsqH1FiDez8uFU8tCKFoRnICYF+BK6mooe/HyzjKQFQTUme7PucbY3wlgU0Tu2i/rtG867P8YkZNjpn1NXItE57qFH1Bkv8H8u3LkIItgfOTFoXqlacK0+iHa6LHGb0nTfu0McXy75I2socbpeXXnprn4VpWnUNhZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=SLQT312H; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="SLQT312H"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ab7917fc0c2so180056966b.0
        for <llvm@lists.linux.dev>; Fri, 07 Feb 2025 20:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1738988678; x=1739593478; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ad+y9v5V1d8/uo/UX8PH+Kn2Gj8SzZ1YpnFWhtJCbhc=;
        b=SLQT312HtbBRtmOD2SQCqj64ihHW5eNUE7dhFb/kTaJ7ypfN8chwp/z9pgXfvXFrj0
         pI+y0UTdibHrURwvBNy/FRet59WyJg+jEUe/Sve6GoOCLE1fc9bWUeD8PgVn1+AG8uYB
         izwfXpS817ANSZbJ1eR643kFLqa+NBTosWAek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738988678; x=1739593478;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ad+y9v5V1d8/uo/UX8PH+Kn2Gj8SzZ1YpnFWhtJCbhc=;
        b=NrwTcTN9kX95wcTz97UUrtNezgUvKfCP2+kWLPTl5xsbQOXBP9rLJPzru6CaJx0RuB
         LiWlpPtb0bLO6mouMvjcM46zusX422Azn5L6Yi39U6jtAKR4fPoYsrmwivCTIKB+/1BH
         axXL/7syi2H5qfm4SVD2rBXhCPDZkSf+dC++wNiS+/MkxDcXGuyLRA2jgQFni2pgUBOD
         wvgsBIxrKEs7LwzEWbV8F8W1w9aN6nU2NLr3ZwGpQoPEpX7auJ5zFCrM2GXnVTMeQauG
         AnahohWoc2HpXI8ZIVZ4X+MZvv7pL7uce1EDyf81kO6yy6dIwROtOmPAVtjoppWort0h
         OWZA==
X-Forwarded-Encrypted: i=1; AJvYcCX3qmTVeultycHnPJ8QG88gAohLMcCE34bGdR9aqdw6GzPruCUJYF5mghccyg+8agKUCQnQ@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7yY9O32zdT7juig15CIm5KOL2cHJLiV7dLC81Oo6SwCfz97Oj
	0PglztwOj27EC6lHPQ5ms2tHOXJIMQEj8FIWK6L1GJS2cIlIaMRJTVTSQ2GLtzr+tWtmBOGi3vD
	OtHhytA==
X-Gm-Gg: ASbGnctm6UF/213zkdoUXyfDcZMAV/0EhhVok92HBkY/EqV107Y6dAzQUG5Pdu7Buag
	6BgzWDgMBUXfLojypeSyqSUVKdGCmFpWDhisJ8Mweb0wc4OGh2450b2op7xbD1VtQP+vQNeyAiy
	zfyGrwbcZE6/c8QS6C7RC7b4oCxzXvCaLcBEzc+LL0D4hYiNyTDDXwCEuj4dbRwak49MIHclceA
	6Vin6UPKs+EhhOwPkHgbaTmW9LPfa2NatHo7hRdm5XidUx84etVeOH8fVu5AuQET4zUjJAxi++e
	/KsvhxJq11qcnYhNoSFegHArUxTcuDmwKiFdKBvIaaWpYwS77gLOvqwfu5iLnmN51Q==
X-Google-Smtp-Source: AGHT+IH5U64TFE/7+6a5yCptftMGD8FH7i5zcX22h6t2LxbnX3GA01ssuchNM9NHCUanPzpreXhraQ==
X-Received: by 2002:a17:907:6ea5:b0:ab7:9be8:3c6b with SMTP id a640c23a62f3a-ab79be83c9emr200875266b.25.1738988678111;
        Fri, 07 Feb 2025 20:24:38 -0800 (PST)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab772f486f4sm385985866b.8.2025.02.07.20.24.35
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 20:24:36 -0800 (PST)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5dc89df7eccso5421990a12.3
        for <llvm@lists.linux.dev>; Fri, 07 Feb 2025 20:24:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUqR/GGmy2XC57k1Vx1Ls/gxpVEKipCkbEzz39EvNWqgw9JDcLjdIynZgvOl2Px18O8TORM@lists.linux.dev
X-Received: by 2002:a05:6402:2084:b0:5dc:7fbe:7310 with SMTP id
 4fb4d7f45d1cf-5de45040046mr6535014a12.6.1738988675108; Fri, 07 Feb 2025
 20:24:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250131191231.1370466-1-bvanassche@acm.org> <20250207164926.6daeac77@kernel.org>
 <CAHk-=wiCJow8C+_fJvZ77taCf0oN0_X7NOR-BaECT2jV0Q-F9g@mail.gmail.com>
 <20250207173813.5081ba76@kernel.org> <CAHk-=wjMux0w49bTdSbC3DOoc9FRctDrRvaqFUS4KFTmkbtKWg@mail.gmail.com>
 <20250208033351.GB3305705@ax162> <CAHk-=whe1UZUGKbtaaRV7CfS=sGtB2ouYAriryZ6bscE+5AFhA@mail.gmail.com>
In-Reply-To: <CAHk-=whe1UZUGKbtaaRV7CfS=sGtB2ouYAriryZ6bscE+5AFhA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 7 Feb 2025 20:24:18 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiSuP=s4vzdT3TLjDfcj4XJDDvOO1bDj2Zd2EJNc6o=KQ@mail.gmail.com>
X-Gm-Features: AWEUYZmBXCnRT87O6jbnri8feGtRx2XTsrR5K-8yZHT40XPhPB-7L-dHaOcsbzw
Message-ID: <CAHk-=wiSuP=s4vzdT3TLjDfcj4XJDDvOO1bDj2Zd2EJNc6o=KQ@mail.gmail.com>
Subject: Re: [PATCH] mm: Fix clang W=1 compiler warnings
To: Nathan Chancellor <nathan@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Bart Van Assche <bvanassche@acm.org>, linux-mm@kvack.org, 
	Ivan Shapovalov <intelfx@intelfx.name>, Vlastimil Babka <vbabka@suse.cz>, 
	David Laight <david.laight@aculab.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	David Rientjes <rientjes@google.com>, David Hildenbrand <david@redhat.com>, 
	Kaiyang Zhao <kaiyang2@cs.cmu.edu>, Joel Granados <joel.granados@kernel.org>, 
	Sourav Panda <souravpanda@google.com>, Johannes Weiner <hannes@cmpxchg.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Feb 2025 at 19:49, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I will take your patch to move it to W=2.

Ok, applied and pushed out as commit 8f6629c004b1 ("kbuild: Move
-Wenum-enum-conversion to W=2").

Jakub, hopefully this fixes your situation,

                Linus
