Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E073A12F583
	for <llvm@lists.linux.dev>; Wed, 31 Jan 2024 18:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706724316; cv=none; b=IWPgGmTKEEupKb9eF765DUFpa4V2Rx7mB5YHMnKPY5e6NciJY37TZ4Ruqxy/DLee2Qo1wpVkcGVAU3QIL2V9TKDC0X27z+CFIPml06LnlyGVr9qCOiowlvrIOY9tb3J6OKld+7OlCit845k19Uf4DVjd0AyLFAvfplHGxfI1lZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706724316; c=relaxed/simple;
	bh=5b1Y+jv0vPFr5ZHAV7L3eINOfbHfAChzyzls62CNqNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c1jMDD9nXXIFfuBJzcP+wvDCUIamnEVWMLOVQSpl+PT11XdoHRK0PDHCrzy3/vHqIZbqLYYwOMdmH66cRRcyQSKiyAAjLewoyKltxBp18fU4+Pg9OhlDPzcWwDiNI0gZhJRqiBG3jvBmwEmoa5ffWGxJoCrIMjz2QWzx8QGhN+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=Klz3wUUp; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="Klz3wUUp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description;
	bh=orLzQozAMoJsl02mt+Lz4xE2Xgx7TKiQZLdMOVbtwA8=; b=Klz3wUUpVwG0ot4ZkcR4bj3Yzi
	sCTG5glmWjZM8veM+TUzSGTdz3uH1s2m3VXqWePpGGT4ZhIVug8saday7+hp/0eZd9i1A9oGp17lv
	soQ/BCOkZuYb38BCThdcXQblpgzFx6RIneUbBK0zrAxinbOA2dUMuBcCKNNEl0Qa4uZxFHN4i4SLj
	X3iqxDL3sZGdjNN4i/NIDMuCNTikbjtNz5JBg+oiMhLItYqGOn/VQoCqAJcGoFNJo/dNdCtT87sIj
	2dymwsx3OK1v4U4EYF5krjd5YAR5q/8MI46eoeQ/L8Hy7g47BS0D72khV9iDQAphbbG21Gxedj1NF
	0nDGtJ9w==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	(Exim 4.94.2)
	(envelope-from <sylvestre@debian.org>)
	id 1rVExU-007DHt-DU; Wed, 31 Jan 2024 18:05:12 +0000
Message-ID: <8e21e9ae-0c13-4b9f-af78-891b95fbdfd4@debian.org>
Date: Wed, 31 Jan 2024 19:05:11 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: LLVM 18 -> 19 transition missing from apt.llvm.org unstable
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev
References: <20240131174445.GA535345@dev-arch.thelio-3990X>
From: Sylvestre Ledru <sylvestre@debian.org>
Autocrypt: addr=sylvestre@debian.org; keydata=
 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
In-Reply-To: <20240131174445.GA535345@dev-arch.thelio-3990X>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Debian-User: sylvestre

Hello,

Le 31/01/2024 à 18:44, Nathan Chancellor a écrit :
> Hi Sylvestre,
>
> I noticed that the main branch's transition from LLVM 18 to 19 has not
> showed up in apt.llvm.org's unstable distribution. It seems like the
> last build happened a week ago. Apologies if this has already been
> reported or is already known.

oh, bizarre. the builts have been completed successfully but not the 
sync to the repo.

working on it now!

Cheers

S


