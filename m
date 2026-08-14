Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9165830C630
	for <llvm@lists.linux.dev>; Fri, 14 Aug 2026 01:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786670656; cv=pass; b=caAb8z4P+71KZHytcDlAtGKhoZ/hP0UEzdQd7ZWSGmgXHxYuKny8hM41E5ou+Ok8zlCQ49s4RgHnPWzvdXVLmFEyDN12+wSK1EPyuodvJqROyx9qApE4Q7EwHQV6hncc1A4AqqHrgqe/U+PoNm0Tc+pE9MzDD0uXhdaRD3xO9LY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786670656; c=relaxed/simple;
	bh=cuyeLpBNdLoVcolWTIViFV7hFI/ReZfXIFwBtv+1YCs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YYy9efpuEmST1RS/OFsPRlyEoRDPfqQQnId7RM0vSlya4QWjG8DunUyJW12juMbIBnNc3Uu85Ym35BGYAKl+N5HDk7w3f+UuwpuFJvH4EgURdrkm0Oh8aX1rGsBjORrHGvg5ByK6faC1BxFeFepifLYtJEZV5Jl7CoT/1NHLTek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ce6iKOVl; arc=pass smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ce6iKOVl"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-902fc790cd5so2804106d6.1
        for <llvm@lists.linux.dev>; Thu, 13 Aug 2026 18:24:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786670642; cv=none;
        d=google.com; s=arc-20260327;
        b=eyQwPDun8tfSvWDHCBOJ7nQHHlNZX7hrA/5YpzuH4SOztMt+15yKt6aWoqxni/hzVZ
         lBMU4W2Lv8hBPcX/hnPHq6gKPaxwD5WTvGEEfF5KLp434MD+vfiCcHjfBBjpZLQhsLSL
         kLXrpTwptuWsyyq20rmGEHTQRJriXLNCdnUwxV650/gnmtTj+o1teftMafJrhWgcX4qJ
         LWg0wltfp8WE1d+03O1XM5Ord+iUhY2zCF4EN/eyzd6ovOuNNvFjgokxZtt2d1c7/mnm
         liiK0AuETX/xMKjZFFijqLPmLUJJmrVWIorZwJEkUHoQNYMgC3WjhNQApAL8QwUzHJtr
         DTOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dIqhgTXMNMbYFoYNlDKpK72/trU4eGHf7U7lg59BcD8=;
        fh=NIxhpLIqb5txhb+sZAG99dwqKRPMhjxgB3DSlWEazJU=;
        b=p7JHeELaCgnUDQkHkGA5RQM6UVGe5Vfbnp8n4yni8p5jZ6dYFxK/SYYJUmq6277owt
         HL8PnoPM4A8Tfn73Y5wG0aqaT2tUuAjwEWLIe/NJCeOA8pRTedMUSb8jBQ93X3Zt7hk/
         GsNRxEkC9zIYWFjQXDKk1hVhS9tMZH4ymGdFdYJYV2fpIWDEPtri7AyKNMs5XfJXxi+W
         MpLgDQnELHR5d8fLGr8dIVLLSHiHYFOF8CJwBN/pKi5wFS8Ga940QkCXsmalzNMjwELl
         2RGPuHLH0UXoUZWsQa5ZpbIf/A88CslKNwx2o/PQnj6aaPVjvRpdJ6I/1rumAo8Pz1xF
         edXQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786670642; x=1787275442; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dIqhgTXMNMbYFoYNlDKpK72/trU4eGHf7U7lg59BcD8=;
        b=Ce6iKOVlMhbYNs49lcYvg32KxD7C/eyf59jPEpJ406pZKbjrBYfLbJdcXCK7CHYIS0
         c/jRb+VCv57Mh3kh3nb4DL1nhrtB5HKd1Ad+JNIfP7cvVc80R0NiWUDIL2L2VgkfgNmz
         4UdCOdegY1RfbSQIgHRA+nPSEzK7N18yp36M5wnCxZsDhcDXYq6diq8wWkCW7BjZGqtC
         mPCQBI4EuusjchNf+rfGS5wKDlvnY0dRQpqNjjQW0iK5Z8EFagZMbDowEu5QI31M9Jgy
         uh6ZFXUtHhePZse7Kl5bgeakiEP7N96DK7zjeXiCredouT15qahKDUb9Xhb067kdgv7/
         AfJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786670642; x=1787275442;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dIqhgTXMNMbYFoYNlDKpK72/trU4eGHf7U7lg59BcD8=;
        b=MXFnhY5gbEVZw1kIqpvSnsZQkVTUUEN0h3j0FNZ6D6GHjR5hXBQ62gqR+IWJZ6jm8X
         HhJu8fIkj5a1VeLSh0/eWa19q2KSuz6lFw8INxVRFViIcEmaSsj+VqhjEb9HSDy7UdOQ
         3dzWIj7wNMZIY2VBv8NhvUS/R87r5EWxYPok4gF424dRVIfrHddt06XssVlVKMJ5n+Ag
         MbwgEH8YKQXlN2T4hOx19gRRagb3VPEDpMksmWqbakOBurbmE460ETPg50Y4wK9jVzN5
         QEWHM/8cZf/QHZYa6tntZmXqwv4lei3ijvEFyQLfksLckYA0pTT2vFuy2sempRpp21o9
         Vdig==
X-Forwarded-Encrypted: i=1; AHgh+RpdEDlfFtFgShO05eLlmrw67CQyXsz1p64CNznQxb0lyN/B/vVdJZMgH6RtKelp/uAQfxrF@lists.linux.dev
X-Gm-Message-State: AOJu0Yxg5P4gpQgNIZDFOf6mRr8Ugn5w17DemqjKCrEQqktS72Fe9fFw
	5J7tdZvXH1GpL63JZQcTQrID76tC8OPb1pDAWD42ER1ZYN2H7OsGNUxDF0Fk+ozJ4kt3qbg1Gby
	dwtJhac75YjeNslPIShmP1tHABUQ2pU2mbvt/khHw
X-Gm-Gg: AR+sD11Eh0M8NZXiC/v4zF0ypJMizo+TK5oTv3EHD7fnuxEopWnUwjX0dwylqfr/sYg
	JXqA/tlKkdlXljnA1Rr3qF9hMp6SKEp39TstQMG2D2hgl7o/kdQsQKs11QJFKS16R1azK2lTVEf
	IdAiqleqWvjniOvgcBkgQWOFkCqEaRbdWPZiP53R0TpEsZSK9kxFqpMdW/t7+Cq3v3lkydGdCb9
	nNnluatDCeOLXsB77CzSfiF4p96AmtEiSegHR5AKUjW8QcJ/+IxU8LOE1AXG/EAlwHYtcfCXOLw
	NN1Buvqc9TzkLTJm0c2tVfZIxFgo8pfo60mpDfGJ1hRy+2aHVy0Yk0VUbXx5wG8WhlZp0NDSDXy
	7/V4Rxx40H/U/mmrc6PSAYztkZZK2988n+dpUMIRjlUtzaMNPfaEij6x1
X-Received: by 2002:a05:622a:4c8e:b0:52d:7a9f:57ed with SMTP id
 d75a77b69052e-52d85381ed8mr28730751cf.5.1786670641602; Thu, 13 Aug 2026
 18:24:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260813222629.492738-1-gmj@meta.com>
In-Reply-To: <20260813222629.492738-1-gmj@meta.com>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 14 Aug 2026 03:23:49 +0200
X-Gm-Features: AUfX_my5-_1sQD24ajVztBBHmvhJOEErJJXlcG4I6zdgItnN7gZx2Uy1YTDUI70
Message-ID: <CANn89iKFHCA9B1+0FkML=BxZ+0ytu3s5YBLjbt5-+X+CCox09A@mail.gmail.com>
Subject: Re: [RFC PATCH net-next v2] net: gro: coalesce short IPv4 packets
 padded to the minimum frame size
To: Glenn Judd <gmj@meta.com>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, Simon Horman <horms@kernel.org>, 
	Richard Gobert <richardbgobert@gmail.com>, Willem de Bruijn <willemb@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Kees Cook <kees@kernel.org>, 
	Jiayuan Chen <jiayuan.chen@linux.dev>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2026 at 12:26=E2=80=AFAM Glenn Judd <gmj@meta.com> wrote:
>
> Software GRO fails to coalesce a small IPv4 segment that was
> padded up to the 60-byte minimum Ethernet frame.
>
> The selftest tools/testing/selftests/drivers/net/gro.py subtest
> sw_ipv4_data_lrg_1byte sends {100, 1} expecting to receive {101}.
> In current code, it receives {100, 1} (no coalescing) instead.
>
> Cause: inet_gro_receive() computes its flush term from
> tot_len ^ skb_gro_len() before skb_gro_pull(), while skb_gro_len()
> still includes trailing Ethernet padding. A small IPv4 segment
> padded up to the 60-byte minimum frame has tot_len !=3D skb_gro_len(),
> so flush is set and the runt never coalesces.
>
> v1 detected the padding with an added iph->tot_len read and
> skb_gro_len() comparison on every IPv4 GRO packet. Instead, split
> inet_gro_receive() so that everything after the header validation
> takes the flush term as a parameter, and pass a literal 0 on the
> common path. That folds away both flush updates and lets the
> transport dispatch become a tail call, leaving the common path
> shorter than before this patch rather than merely unchanged.
>
> Assisted-by: Claude:claude-opus-5
> Assisted-by: Codex:gpt-5.6
> Assisted-by: Meta:internal-AI-tooling
> Signed-off-by: Glenn Judd <gmj@meta.com>
> ---

I am pretty sure I met NIC where the extra bytes were not zero.
Unfortunately I no longer have access to them.

Your patch seems to target a specific NIC.

Look at my prior commit : I made it generic. Checking if the bytes are
zero has the same cost as computing their partial checksum.
(real cost is the cache line miss)

commit 88078d98d1bb085d72af8437707279e203524fa5
Author: Eric Dumazet <edumazet@google.com>
Date:   Wed Apr 18 11:43:15 2018 -0700

    net: pskb_trim_rcsum() and CHECKSUM_COMPLETE are friends

    After working on IP defragmentation lately, I found that some large
    packets defeat CHECKSUM_COMPLETE optimization because of NIC adding
    zero paddings on the last (small) fragment.

    While removing the padding with pskb_trim_rcsum(), we set skb->ip_summe=
d
    to CHECKSUM_NONE, forcing a full csum validation, even if all prior
    fragments had CHECKSUM_COMPLETE set.

    We can instead compute the checksum of the part we are trimming,
    usually smaller than the part we keep.

    Signed-off-by: Eric Dumazet <edumazet@google.com>
    Signed-off-by: David S. Miller <davem@davemloft.net>
