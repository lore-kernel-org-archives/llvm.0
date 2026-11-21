Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795264477;
	b=i7FHXDBJuedatBu8nP2IYFosM2/O0zDZZLfzSd62OSKxzzQSoltV+DOt7T0R0Gt3/CqK
	 61dAt8DSmRxDYkA1jJ92LeXnHV27nggO39Ow3Qgn1qzp6P5QgqWh8He55v3adiqcVQPbW
	 4NQxwe7tEilxl3yLXLztb7gpnfDCWopM+xv28R3W0CJ3HzGMRHQ9lND9T9e0hfoz3o96s
	 7DMM9cknV/3dwupGQ+dpfUiERi87ug/NQo6uEPY8o6tUHsefeaLG0clryLL40yjYcxFwL
	 4PJ6JpsZdEvkIggneew8SjXRp6BHnMeZuKxRgjvl6Et6bC2kHlhPZaP6OUxrH4ph3HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795264477;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=nvHNbqHWqikzvI1C7XLBgkMbqGuJsO8eeucb2RNy2jk=;
	b=Lg4YxAKkNHVZMDRA/drskSpodASgSZe1D/dYrijXQftkzl9e1EfSlg1WTfyZ1z87pFo8
	 Ver1zFLi77/A6oeWWLsdfaJyZwEaavf05ed6C1sA7g7pIVwZgLPD0XyFo15Xy2p/JVohn
	 034jyZLwgCAX3i/83UkN7/aIZcl77EzmrTYVFAL4F1waYelPB1lvHW36oEQvjXTJT8U28
	 g0fmUMEsn5cP4ktGNqKe9QvBKJMjJGQGmq1EAiWzn8NXSt/EsSJakh5G9VWzUbhfw1GJf
	 7OxWiqiVYaAgo1KZdAQWgiRv4MSG2KyrCKKBzKRjgq5g4bp/9mI9vuz1vL/nzEvJgOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="R/KSUD66";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB27606A320;
	Sat, 21 Nov 2026 12:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R/KSUD66
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0303D1F000C4;
	Sat, 21 Nov 2026 12:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795264476;
	bh=nvHNbqHWqikzvI1C7XLBgkMbqGuJsO8eeucb2RNy2jk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R/KSUD66RadEA8FsSRBGKnNidVroc0Uw/pRckPDUXw/0H0s4niWFkpn3lrKRp22Sv
	 qDCdYMjMoeJCsbRAt4/oyJzrgxQYln3uU6AGEhV5mqWYWt2GhDEtdPKaeZdMrHqxql
	 71u7DnDxzlUIfyvMQj6CMCf7ok3hfJkx1ZtJzBod0qFKiYz/OGmhO9avURQzwUxriW
	 w2uwSuD7VMuRbDtSQjgkah2a6Rt9/waFttAqIqwMJa6KVmXbk0kvMSJtrX1RExQ37P
	 8kIUCTBDkSAcix3vtGZ+AYS+g43uJ+IeRIijThzUPmL5i4O5KU4S3CA0DTzZxBQ8UP
	 SzldoYgQY68Jw==
Date: Sat, 21 Nov 2026 13:34:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, ath12k@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH ath-next v3 15/15] wifi: ath12k: add Wi-Fi 8 PCI driver
 scaffolding for QCN9575
Message-ID: <20261121-logical-flawless-mongoose-9dddea@quoll>
References: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
 <20261118-wifi8_qcn9575_bringup-v3-15-9875d2a3953f@oss.qualcomm.com>
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
In-Reply-To: <20261118-wifi8_qcn9575_bringup-v3-15-9875d2a3953f@oss.qualcomm.com>

On Wed, Nov 18, 2026 at 01:45:38PM +0530, Madhavan Ganesan wrote:
> +
>  int ath12k_wifi8_pci_init(void)
>  {
> -	/* Wi-Fi 8 PCI driver registration will be added in follow-up patches. */

Really? You just added it in this patchset!

> +	int ret;
> +
> +	ret = ath12k_pci_register_driver(ATH12K_DEVICE_FAMILY_WIFI8,
> +					 &ath12k_wifi8_pci_driver);
> +	if (ret) {
> +		pr_err("Failed to register ath12k Wi-Fi 8 driver: %d\n", ret);
> +		return ret;
> +	}
> +

Best regards,
Krzysztof

