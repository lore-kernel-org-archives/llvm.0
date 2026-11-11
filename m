Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794355258;
	b=kvbGU/lvV5SQQSipe+9q0JK3f9q8X+TExkrx11EaSIC5h3+ld8OI+nhiReQlBT6FeqO3
	 hwPRiCvqXBL6ksQEj93akDf9/mDMNEQJJKcP2YTEELxSU9iVoqz2kSWzktglV9JjZiMIi
	 G3AVX0qPkNp06Htfk3UluViRgh6bqU9HcSnsGuE4+qy/Bloa117AX2N2Zo+BUA3jkvKO8
	 UIpdqC9zGG2LDNDo51/15/2NPTJjVECm+2up9/zlyPY79vvYYoc0lBsYTzGXQYcA8dgoz
	 4kUZKbPpPcNq20IXjDNDaNipKr4/V+2101dnvk7aEpolLb1c7W7U6yskO3fzUDoQrGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794355258;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=bYaErAxQk82jgbOAPhvOLDjqMW7sA/6+9+NevIx4alw=;
	b=DrVW88sMD6OlA1JTshgJdLBXwOAjEKbYsTdZAmbs0lVJThspCrH7eOxJoxNecV8D6/lA
	 IrrEbwh+e8PZd04e6SZZeQT7F0hbiar9eBvtypNecMJIpkEYy/3ocya3oPxL2Gexn5NYI
	 xM5pgVytrNK92Bv4wwzMyJg5uiNxprc56qo8zPUJWEhD/KZ4wjPY+vHLnPn5dk6FijR4p
	 W/EJ5QnxZJUBHXP8dvF4o/GZAoonRWWLkSMMf3V0I/R+IF3ldkS4RxuWdjk7N/djVtWEv
	 iaeCZnn+s6jFVXM/N7u1ONfCrCheGb1geJvmdsTCvZxO4G5LlwEdgID1hmEiDXewo5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hn8Mehet;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3371B606A31C
	for <llvm@lists.linux.dev>; Wed, 11 Nov 2026 00:00:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3371B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hn8Mehet
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-36a6ce64b95so1669591eec.1
        for <llvm@lists.linux.dev>; Tue, 10 Nov 2026 16:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794355257; x=1794960057; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bYaErAxQk82jgbOAPhvOLDjqMW7sA/6+9+NevIx4alw=;
        b=Hn8MehetF5q8AAEQqm3aWsWjcflBlCWqYmaKsNp84WilIq8o+F3dK3fKhs/pRc6gv7
         8KIFC8xWGD9DlNPfka1Zc6ZyrMy9HEXzhUh05Fqh8b92tNHwKAih5sJmDfAi2CmvjSyr
         FYebGwIgQcWmkmYWgMNh1ymQmV57OcpZ28u1eRwJ+fQt3HnmxUMhRfbrMGUTAt5napi/
         /vjUJ3gtb0gnYW0bk8yQV2T7wtCoUPHR/mX7D+q7nweup6d0AwUb3csTk95/FaSNOsm/
         tHobKZKTSTpCiKo42VMfSSRc0VGxKQSPBuUuhDS4BqlPt4VgNNTimRwZ7ykQZEfv79Ha
         vetg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794355257; x=1794960057;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bYaErAxQk82jgbOAPhvOLDjqMW7sA/6+9+NevIx4alw=;
        b=s8tvwnBnFwpsOmlnJ4A5Unq2J8ZTti+4pvrvF1Tz1OYPGOeoG//wpEYOX6Xm9vWt/x
         XlAWDW2PyVZi+ia+uyufKOkEACVDeqSO1gt2laDQsMdlXRgA03IEIVfEukJXyjxxTAML
         1nX+zPNAmrxyLcM5Z0DQSG2yNjGkUOiDomXoWzDqcxDR0TgQe5bVIZeJm5wgjkLEeIwT
         gcLTfuVQhMw88qDYC4NIWji2B2pVejS3zRuIWK9qgffQQqvjimxMoRMDdDvLaC0HYzFk
         Wc+pVNUr9Ewvu1b9sJ/TVqCSuGkmMmzCb0S0IUOYKczGBpH9IRo5udcMqkhM4uOjNOFz
         pp8w==
X-Forwarded-Encrypted: i=1; AL+hErGiJWwzZdETpJ/33QFq0FomALHlUGYDaxPiDE8jNMiYk+EenlNjS/AC5tl35RFded7oIYAr@lists.linux.dev
X-Gm-Message-State: APuU4Z/Bqbf2khgj0zDdfpSSwKj6k/qR0TmWgNgbwgLzgRtH+uTYpvd2
	18TvzOx0EWusz0LsCJTzEWLTr2gFEyMbnR1DkGscVOVOOXB9SULlWa7B
X-Gm-Gg: AYBFou3tt+QvavrodlnOakw4N1VgIt/NGFs2cta/Qd4R0TpbzOdavfFereuiXg11YVL
	mqpFdJgjXh64pJt1Na4uyt2oh8PpkL58LP7bLieJJXg5JLtsH+6cA6FUbNnqW6g+JEltNBiVHwQ
	osIiBqtuP3EuEvxdaCR6etDBOhopuYxLXPvU3NgzdsqikRwSyjQQcyIzc41F1yfkQ3KjgkfWkd0
	4/7GqFgsPTZBHGlNZe6UstiVsHRd8qJdD1s5yUBmyrj7SYBKF5drSv+lS8Fyz1RA+V1uwAUgMhM
	5oMhvAgk/5qOglnR7fE34wSUC0p9PkW7+ETIvJXfFrPjbX+n8QtL0lingBn2xt/VFJ4ktFppkkM
	eIr4uKQh6Jp+5wBOQj2mWZD1XcLjX2cQnSCJoYmELChd2xlu20rFaCUaZhyBJcuKSIvzWrdFWhN
	mcqF/OJ6lcN8OQs7swo+/FZjatS+mST9ggkgCTSs0XUN68NRRHq8tz6j85FTZi8GOBMOrHhNMg1
	HTOmSlFetuyqH21oRa46zJwJBIJDMy8+jML8OYXSr0+QaqNwh0NJKfKhkVOfa3S4YSJMWg4Y8jf
	9xAymA4FM6HaJ0AUuf73R9eZ
X-Received: by 2002:a05:7301:90b:b0:375:4366:a90c with SMTP id 5a478bee46e88-3768730e517mr1138142eec.41.1794355256884;
        Tue, 10 Nov 2026 16:00:56 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:71::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375218c7c50sm19090263eec.29.2026.11.10.16.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 16:00:55 -0800 (PST)
Date: Tue, 10 Nov 2026 16:00:51 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Tianyi Gao <tianyi@cloudflare.com>
Cc: bpf@vger.kernel.org, netdev@vger.kernel.org, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Jakub Kicinski <kuba@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Vladimir Vdovin <deliran@verdict.gg>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Donald Hunter <donald.hunter@gmail.com>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Magnus Karlsson <magnus.karlsson@intel.com>, 
	Tushar Vyavahare <tushar.vyavahare@intel.com>, Jason Xing <kerneljasonxing@gmail.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Madalin Bucur <madalin.bucur@nxp.com>, 
	Ioana Ciornei <ioana.ciornei@nxp.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Chris J Arges <carges@cloudflare.com>, 
	Jakub Sitnicki <jakub@cloudflare.com>, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	intel-wired-lan@lists.osuosl.org, llvm@lists.linux.dev, kernel-team@cloudflare.com
Subject: Re: [PATCH bpf-next 00/15] xdp: add SKB core extensions to keep RX
 metadata until skb creation
Message-ID: <avOvI8xrHI0dwyHj@devvm16445.scu0.facebook.com>
References: <cover.1794281983.git.tianyi@cloudflare.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1794281983.git.tianyi@cloudflare.com>

On 11/10, Tianyi Gao wrote:
> An skb gets its RX hash, VLAN tag and checksum status from the RX
> descriptor, which describes the packet before the XDP program ran.
> 
> Without this series:
> 
> - On XDP_PASS, the values are stale. After the program strips a UDP
>   tunnel header, the stack applies the outer CHECKSUM_UNNECESSARY to the
>   inner packet [1]. If the outer UDP checksum is 0, a packet with a bad
>   inner checksum reaches the socket.
> - On XDP_REDIRECT, the values are lost. The skb that cpumap or veth
>   builds from the xdp_frame has no RX hash and no VLAN tag, and its
>   checksum status is CHECKSUM_NONE.
> 
> In one use case, an XDP program redirects packets into a veth device.
> The checksum status is lost, so GRO verifies every checksum in software.
> With one TCP flow, this costs 34% of the receiving CPU.
> 
> Another use case [2] is load balancing IPsec tunnel traffic with cpumap.
> Without the RX hash, GRO on cpumap puts all flows into the same bucket.
> In a cpumap test with 16 TCP flows and no IPsec, the throughput is
> 17.6 Gbit/s instead of 23.4.
> 
> This series introduces SKB core extensions for XDP. It reserves an skb
> core extension area in the headroom, right after the space for struct
> xdp_frame. An XDP program stores RX metadata in the area with kfuncs,
> and the kernel sets the skb fields from it. This design was initially
> proposed in [3].

Awhile ago we discussed the alternative of adding setters for xdp metadata.
Then the veth (or whoever turns xdp frame into an skb) can apply whatever
metadata it needs (and there is some magic behind the scenes that takes
it into account when creating an skb). That keeps the layout and most
of the code outside of kernel. Have we considered that here?
