Received: from www74.your-server.de (www74.your-server.de [213.133.104.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAF122DC2F;
	Tue, 14 Jan 2025 10:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.133.104.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736850326; cv=none; b=Jm/coT/3qy6OqkSEWGD8zBa/v0Pp/1omVgiF3n1iqBsq7wJHfpPvc4Ewac2w3i+cfYvG2HxwWLLqa27YBxVmbyxnqEf89WXtbNP8pR9/5xjHbW+KmsrWeZcH4xjj3UKPrHvWfu/7FyowM1U9jlNO5fZpypRknhQQUiq2uTwhLgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736850326; c=relaxed/simple;
	bh=WX0oF8/6a+AEHpQ0IvHENilqROkEztCX/UwP3didFGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RjbZpdwrMhWp9CKnpkSr5xNd1rd3sGa97eOiKLzRoHQufPE7EKW3AWj2VXBi7F0vCuGFUjpf+MvacJmYLJCvc+smVjEt8TuYUfjCMLeeAR09Of1WoOYHHD73cgKqB1SsiE2einc8myg22vgdwtjFnaTxder5iflqkWHMOpmhEi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=computerix.info; spf=pass smtp.mailfrom=computerix.info; dkim=pass (2048-bit key) header.d=computerix.info header.i=@computerix.info header.b=PPiXE0sV; arc=none smtp.client-ip=213.133.104.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=computerix.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=computerix.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=computerix.info header.i=@computerix.info header.b="PPiXE0sV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=computerix.info; s=default2306; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=eQr7w4OLpquFDbSrasmaDyIPnTAh7Q+zxElwLX45Mi0=; b=PPiXE0sVrP1Eer2tk2QOeeaRud
	dkAuisFWa0+bTv0Ta+ugCZn05lRv2Apnu152uh0+Kl2Q0W8+nEzao/bYYam5KVMqKm7+5eRZKdRh7
	YqHEu+ZAGz9tlJIFU33xQLEIV6BlQesGm8PSRHHH6/py4dLw/C7BqG6XRnUjM415qNOr+emPXKzQ/
	P0gZcCS1kG6EpnHPHuM9OkhpWiVO2ShYC7DlyikbFkoUyGyZvDBlv2xjxR8tm2qx66g/vhwQbdRvy
	YLi90Y7XBIiGiQvzNtzVeeqauDuciLb2uqU+iTf/4iAWBIc9hAjPIYGh5oAkEI0i/gkvklAZEAkVq
	jhv6UIWg==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www74.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <klaus.kusche@computerix.info>)
	id 1tXdi5-0006B4-7P; Tue, 14 Jan 2025 10:59:45 +0100
Received: from [212.172.12.94] (helo=[192.168.178.21])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <klaus.kusche@computerix.info>)
	id 1tXdi5-0000Ml-08;
	Tue, 14 Jan 2025 10:59:44 +0100
Message-ID: <46c1ffa7-7531-4d4c-b302-e3ae244b57a4@computerix.info>
Date: Tue, 14 Jan 2025 10:59:44 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: "Bad or missing .orc_unwind table. Disabling unwinder." Clang 19
 problem? 6.12.8 problem?
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>
Cc: peterz@infradead.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>
References: <b248a0fb-e182-42e3-abf5-83945ee992f6@computerix.info>
 <20250113214122.g4lluwpzj3tnamx3@jpoimboe>
 <20250113235835.vqgvb7cdspksy5dn@jpoimboe> <20250114095159.GA1580513@ax162>
From: Klaus Kusche <klaus.kusche@computerix.info>
In-Reply-To: <20250114095159.GA1580513@ax162>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: klaus.kusche@computerix.info
X-Virus-Scanned: Clear (ClamAV 1.0.7/27517/Mon Jan 13 10:41:18 2025)


Hello,

On 14/01/2025 10:51, Nathan Chancellor wrote:
> Hi Josh,
> 
>> Nathan, I think this is a Clang 19 issue, where one of the jump table
>> entries is pointing past the end of the function.  When we saw this in
>> the past I think it was due to some leftover optimization, where the
>> jump table entry ended up unused so it was harmless.  Are you aware of
>> any recent bugs in that area?
> 
> I am not aware of any recent bugs there but if you or Klaus have a
> configuration file that triggers this, I would be happy to bisect LLVM
> to see what change introduced it to give us a better understanding of
> what is happening here.

Kernel .config files are attached to both

https://bugzilla.kernel.org/show_bug.cgi?id=219685

https://bugzilla.kernel.org/show_bug.cgi?id=219686

-- 
Prof. Dr. Klaus Kusche
Privat: Söllmnitz 32 d, D-07554 Gera/Söllmnitz
036695/859909 klaus.kusche@computerix.info https://www.computerix.info
Dienstlich: DHGE Gera, Weg der Freundschaft 4, D-07546 Gera
0365/4341-306 klaus.kusche@dhge.de https://www.dhge.de
