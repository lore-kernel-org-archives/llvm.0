Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795264626;
	b=FMMTQsoJh7UECARRwNARkxk02oyT70vVyb94yURk+d22atEMB6bGHM1S2HaN6ilkUk2Q
	 +lQrpSfic2KqBBnfMQvhAS6eG9MHkAtbuU7NCOOgHr5Y6Xj4ZAzsbNcQ4UizJTfW1pHay
	 TvzQ20p61eugtbaO0flDeRLfbBTwQHO72uw543L44Rx6ixlTTTcHpwoEYgj5S3Suo6q+H
	 hTq8XNffCmjwIDJr7QopjGhm/GA/3IsyE/6/qvM+5vO2ntA1ihLTfCfvAtPzVJ1j3i/s0
	 Z7Y6lezckifm9HZXf3gBpUKok0CZ1kWRRUu8EdjCyaXWGA+hFL+NZ3c3zZprTXkj2cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795264626;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Bn8fYVdCnsxzaxXf/0e+OavoSH4Fq5m3TkgWBOG16mo=;
	b=eXbb2oBz00LnbrmYaeWJBOxsw0Jh72PFEE+tJ+WHQElkzMvdJfZ2FLgIsXAa+OsvrBm+
	 o0feHQPUt99s8957nRJzRjZdhS3oQb0z0dhE7NBi/lS7ZvWnC7L1z9BCeiJlkgDhqxD+o
	 SrQarknMamMM/IgxZXolu6KPznYm4JpZa3PEPW7eE+sZNgoDXz9WYNjK7/2esc7CmomSM
	 KvUoAHs4YwAMLFV4Yu3eewT+k931A1FcOSZSr0YBpsLiVE4qDQMWd6N8NI1KN5voT0Ift
	 loWC3KFdT/7RjY0sZSqQnngDA1MdebapIrxkeD0kk3uYPII6qBZPnUkhm44Uen1JhHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RnADEjRu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD42606A320;
	Sat, 21 Nov 2026 12:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RnADEjRu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1317E1F000CF;
	Sat, 21 Nov 2026 12:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795264626;
	bh=Bn8fYVdCnsxzaxXf/0e+OavoSH4Fq5m3TkgWBOG16mo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RnADEjRuJ1PyJwBoW8/yT7wcTg6Aaq/v5dbP7Z4QZIY+KpAvkZvYGotnFbK/yrCgy
	 rZP5H1HwCJKnx8dZ0MfJ8nJlUo3k+8Sui8eJQt9fU76Zqn0eCze8RAUAOdFjlFIgVt
	 QpUXyhlaUypPCrxxItQWzopcGxYnZe/8GBJWKa9XizqtC4LEbMSzal+kIzVrbuAn24
	 wfFtnkaOuCpNhdFuIKjyMlrQwKMYOGb7FqXvmbhVajYCtRIpyVrWZYmyM5CWCo75xw
	 6ULSB4Kcvnmg3OWi3werzIPimx+BNwsCY04fKnI3rolgYjpgVBx3CUOM41pDWYDk6u
	 ALsZWOjFk8gXg==
Date: Sat, 21 Nov 2026 13:37:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, ath12k@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH ath-next v3 01/15] dt-bindings: net: wireless: add ath12k
 wifi device QCN9575
Message-ID: <20261121-lobster-of-unearthly-variation-e75ea9@quoll>
References: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
 <20261118-wifi8_qcn9575_bringup-v3-1-9875d2a3953f@oss.qualcomm.com>
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
In-Reply-To: <20261118-wifi8_qcn9575_bringup-v3-1-9875d2a3953f@oss.qualcomm.com>

On Wed, Nov 18, 2026 at 01:45:24PM +0530, Madhavan Ganesan wrote:
> -  The ath12k devices (QCN9274) feature WSI support. WSI stands for
> -  WLAN Serial Interface. It is used for the exchange of specific
> +  Some ath12k devices (QCN9274 and QCN9575) feature WSI support. WSI stands
> +  for WLAN Serial Interface. It is used for the exchange of specific
>    control information across radios based on the doorbell mechanism.
>    This WSI connection is essential to exchange control information
>    among these devices.
> @@ -48,6 +48,7 @@ properties:
>    compatible:
>      enum:
>        - pci17cb,1109  # QCN9274
> +      - pci17cb,1113  # QCN9575

I do not see any user of this (see submitting patches in DT directory
for explanation).

Best regards,
Krzysztof

