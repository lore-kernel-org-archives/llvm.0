Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8FB181BAB
	for <llvm@lists.linux.dev>; Wed, 17 Jul 2024 15:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721229010; cv=none; b=GEA9iGApdn7M+GGik0gbDnAFV0jGI7+suyVCNJOImy6v8QPP9cqQQca78VEFXsXj5Oee5eGOF3B1jAeRO1bUjbrwzbpkzb7A14cXIAw4nxs6/czAwgXPQvd2tPPrQCI16Ez3WVjFZCBNsMeRU4btAiaHRzD97IuR3ZvwlxByOGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721229010; c=relaxed/simple;
	bh=9AeB1Cld1cJEMg5GVGQ0RSv/VK08VTbFq5Y6/MY8Fvo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=doc+LOTEDh1BCnliXwsqP4eieHXcLRUS4lQ7DrruCMN9EalvWusrUG92DmljrQUco/mIjMgpvmfE6ajpIempMUWW6zaPBbMWQ4FjEBmC4aIgnSqbT84Gaxi4ItuySVBIjXmTXsz1RLWHd1y9Y/V3hO+d4Ifm185mFiAWXhT+joQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IIxMOErL; arc=none smtp.client-ip=209.85.219.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IIxMOErL"
Received: by mail-qv1-f68.google.com with SMTP id 6a1803df08f44-6b5e760eb36so39361356d6.2
        for <llvm@lists.linux.dev>; Wed, 17 Jul 2024 08:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721229008; x=1721833808; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yimWTa4m4zoMnZ3DEB5KnSaVlkJzZMUAmC/Q4ehMeE4=;
        b=IIxMOErL7sXQ88SPgvgD6Du1QmzCAEXv9i+FkGqtA5EfEdSokaaVRu0eXLudO2bT7s
         fHEdnd8+ML+H1W7wAbWO2r7AJVEsxbJND6O/uZXzDQSwdctlKJPFylxNbdYJJ+blS5i8
         RhSqDO6jY2itLmhrDMNZiKoz3QJL9612JcEX3MAh9mK7dhIa7tQ+ZDEkXYAn2Ozd4Eu7
         pVyDTUBwzwz7KinQcW0qh7q3GCfgdX8ECFYLePqh/quT4uzTOGiBLUGQRR+fgd4jTIEN
         bxkxnFVV1zxrD8iqDiioOGKxAI6Ag8e58vscIV+R3ayr6XxhJGeU4M/wpSvnMpLuzP+H
         5dNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721229008; x=1721833808;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yimWTa4m4zoMnZ3DEB5KnSaVlkJzZMUAmC/Q4ehMeE4=;
        b=iCr4P3+QnWiYc5TpE7yOe9jHG/jmEBS7YrC+Cm0yqONq3BosTOK+2FfJOVqbheqG5W
         OWgge32R4lxR2S2RWf+87T329L5O5uKJcjX7Hb7umvn1ORvpqbBAQE2M2BpUEpqss3aP
         jX8zBZnYD7/fbAPU0aLTh3cQcsS8BY81UvnADk8Yw/opTT5zoYcb5WHeY2ViZXjsfTHp
         UKnL6gJoMsvlBwhqGfdv9H4512RngztzTCzXszw31TPUMie77mwskNAI3yOCbHZiGOhv
         KCbRhaX5QsbgI+ocwohweIxMgyA2cBmlChwoH/Vm/iyeaP9wMXfrHPAv/Dwg6KYUFlWY
         SUHw==
X-Forwarded-Encrypted: i=1; AJvYcCX9JnxckTOw/PpHdMgBdUY20L5OyDJVvVLFfo2GFk2c6XRnMuVABIKnn2Pj+JOgaaDBiRXY3FYK1vzmdTyedkSNJsGiJg==
X-Gm-Message-State: AOJu0YxuF/ZAq2m25HXjTrRcKPGewGSgZ8gGlp1Rky+U2E7RoGJlDevF
	4o4JJVPBfO7OH9VLPgXMNtaiW5bFLbDxxIMPVOwrmA19WVBDsduZ
X-Google-Smtp-Source: AGHT+IExgG9Z3pY5PUuoW3p5dU/ApHsjWPWX01eIx0K5DEQCTwWudRCZqlY3wTag1iQr78dEqgcDRg==
X-Received: by 2002:a05:6214:1cc8:b0:6b5:e3b7:46f5 with SMTP id 6a1803df08f44-6b78ca624c7mr26524626d6.20.1721229008237;
        Wed, 17 Jul 2024 08:10:08 -0700 (PDT)
Received: from [192.168.158.7] ([207.35.255.94])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b76199f60csm42590336d6.66.2024.07.17.08.10.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jul 2024 08:10:07 -0700 (PDT)
Message-ID: <0a4dd531-f075-4cce-9c15-30dfa1d0876d@gmail.com>
Date: Wed, 17 Jul 2024 17:10:06 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] rust: str: Use `core::CStr`, remove the custom `CStr`
 implementation
To: Trevor Gross <tmgross@umich.edu>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl
 <aliceryhl@google.com>, Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
 Manmohan Shukla <manmshuk@gmail.com>, Valentin Obst
 <kernel@valentinobst.de>, Asahi Lina <lina@asahilina.net>,
 Yutaro Ohno <yutaro.ono.418@gmail.com>, Danilo Krummrich <dakr@redhat.com>,
 Charalampos Mitrodimas <charmitro@posteo.net>,
 Ben Gooding <ben.gooding.dev@gmail.com>, Tejun Heo <tj@kernel.org>,
 Roland Xu <mu001999@outlook.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, netdev@vger.kernel.org, llvm@lists.linux.dev
References: <20240715221126.487345-2-vadorovsky@gmail.com>
 <CALNs47t=YQX+UP_ekq_Ue=BrA4JscDbU1qNDoKFar3yUbOSZ5g@mail.gmail.com>
Content-Language: en-US
From: Michal Rostecki <vadorovsky@gmail.com>
Autocrypt: addr=vadorovsky@gmail.com; keydata=
 xsBNBGYJcUEBCAD3ciAzHQ8NElYQtsiPZ9NjsR7ttfihe0FM+PDT+6cChjFLQ8qO/1zEL5mh
 YaLbkjitrIYARhmo3lRDq3+G4L5+gRVExm9Rd98PcQy2P9F8shxI/msC50i1Fb9N4D0pP8Hx
 hhZ/or+2mbokZh8Qc9RdjynXRXAezhOFN4+0L2jkN7fjTO1IArl+TirXx+cvhQUbwKyyJlGL
 Kldvue2EqU4maZ+KIUs5di3kZgDPLILzvBqX9TLtwEMAkNY1uMCKK+C2aihap19OjoK0qOYj
 IahVHjqGL+Mb/Ga7jxMGr2TFeQEcwIgvdRiVVLtu+uiaRKqULGokBL3l9gprtBZWdLq7ABEB
 AAHNJk1pY2hhbCBSb3N0ZWNraSA8dmFkb3JvdnNreUBnbWFpbC5jb20+wsCXBBMBCABBFiEE
 3RZt3oLrB5kpFLy14qU49yah1xEFAmYJdCQCGwMFCQHhM4AFCwkIBwICIgIGFQoJCAsCBBYC
 AwECHgcCF4AACgkQ4qU49yah1xFuDQf+NE2Oy6zF+uVh3vtidkfacCSMnu1QxojJHB8C1/Ep
 g4JU5hPcG9hC+HrMs5/Hqs7DOike9bZjhpEmnW4DIeI7Wy3t1Qf7A8EOzS0nrMgbX8TnkEon
 zMBBqiNp3VVVcltRJtc58xMP8K3yu6Ty2Q8e6GWdL5bqDr9gshb+vWu8inh5CullsGRJFJl0
 BfSdDKAbpH3NdEoWnL4JvFphpouh2vhd/ScvfNAQcuyBn3cbCyQdjNTgRVBkBNDEYCaWLVqP
 r4IU0JNjgk+cTLbyFmgn2++bWoIICGrAeWGruSpl7UGJ2PdJokWI9zp5UqSCezejDS53yhkU
 GsCrF7LrTceB6c7ATQRmCXFBAQgA2yrqjTKvL7VJKi/NNcpQ7EvAEm6omO+O4wQltdpybaxe
 mbLT0vZTH6rjZba28ixZmFHtwOjzNNtabmb4uK+nxs0BkVBpRvJNJ0LM1ydGYZQ46Sbvr1dE
 7yWDkkG1CjmXYGd5I2iqx+ATbdrtzDGWLsvDXd/yEaO9dxAR+LqGOg1HdgE9Hhmuv8BRYSCL
 vnXaMA7Orq9oAmu+Q5q9TT3aZGMdBFdcoUNSVPX82uIYXjDaXj0Del8tluAHLf3oV7ZXEgOx
 c6OpRY3+8Pr9//UtfoaHNOjoKFNyPaIUf5U1+E9J0UoDm8m1usrwnghg6yRyPhczhCOvbYNL
 hQ6TiImvowARAQABwsB8BBgBCAAmFiEE3RZt3oLrB5kpFLy14qU49yah1xEFAmYJcUECGwwF
 CQHhM4AACgkQ4qU49yah1xHetgf9FpI4Y+okwFRIqRa6WJ8jhz6us+oYKedftr313NwerUB5
 8nnhK0YWkZWZMuu5B4LCMiv71Ugqlc7ahBy5sQx/acRPe+NiYpwiN/pWrv7njaA6evDieXL8
 jc3j+xy4fsi861BWJXaurWQtLMXyHBUmdJ+StU7tscYTPe4fN1fdkBh0SreZxLfvp/+SMRQk
 g9PmXb1BMZdw8gWghPAbYg5bfCzXF9iZp4bmjuCENfwG4zmnYJzR6uTI0reqECo6Ee7NjOQ7
 qKy29wW+kVnEjX481iCEUmqKHEaQB08Ueb45If09fThw1baHLAk6bFk5cabMtD3JbWEifa6M
 RS+eXZNwwQ==
In-Reply-To: <CALNs47t=YQX+UP_ekq_Ue=BrA4JscDbU1qNDoKFar3yUbOSZ5g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.07.24 02:45, Trevor Gross wrote:
> (also, v2 and v3 are appearing in different threads on lore (as they
> should), but they're in the same thread as v1 in my email client - any
> idea if there is a reason for this?)

No idea, I've sent both patches with:

git send-email --cc-cmd='./scripts/get_maintainer.pl --norolestats' 
-v${VERSION} -1
