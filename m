Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9341D35F5E7
	for <llvm@lists.linux.dev>; Tue, 21 Apr 2026 19:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776799855; cv=none; b=iBV4tHdcyFA5R0+wRPXDHZ3NKTwqGbgUVC+ynupC30K9qIFm0NCDTBscyFOmjfDR13FhO5wns9cqKzt7Hs9fwL3Fd1kHe95BumXWZdCBmQVC1p9H7Drnws+FHUvji4vjg/MFkrkEu7SOA7H0Yp0thXniWoe45ZF4FaB53PcdzDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776799855; c=relaxed/simple;
	bh=+ekfFsVjBUIy12Mq5EIVfZt+aTjmQNKWNgUXpxJaAZQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=s9V2mJSRa2bq8p+QDfPtibvVP333vGgvv9Hg7Qrd9HJcQHKDZHIJKLRjFqsVC1/rPiMGYwKCHy75014etYZUzoWAGaGbwVrxhvHuX/iyuzKw/J7XYXDCjSF3dz5MSI3boEqhMjw/ISprhrRvZFC+TjqHkDCw84BzEfUiEkZD3Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=P1Tg6SiL; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Jr9kxChT; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="P1Tg6SiL";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Jr9kxChT"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 9985B1D00213;
	Tue, 21 Apr 2026 15:30:53 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Tue, 21 Apr 2026 15:30:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1776799853;
	 x=1776886253; bh=xvnaEB3WbuHAEr+o06swJzcGwu2o+Z15ZMsx8gl7EXI=; b=
	P1Tg6SiL7m1Ycn3usSzbs4RQytc3Ay9MEgmf67xCNMQ/X58ujnYoYBk623yZAagK
	TryJNjL2V6GeJ0NcGq6uKiVF4cTuIwzNJe4nTazVCRwJzX02EBXQx6b9LvKgcqdA
	j0KRSEm0AEbJosXSs1grBhv16L/wRx1fZihlDVazPAH4T3ksHaFDSPY8S+rWviIc
	kMBeZD+W+w0x12tqgIDa4vT2u29xMzwbOSXRShJj+uf6PAEMlONBeQNmg5Pw5j70
	HKx92Fh4hC0s0GppIDe+GkpSyM+AxH88khBXa6o65gWiHNxBd0EmGo35F4cQnj7M
	mI1ecUcL+nGyenkfH6dUWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1776799853; x=
	1776886253; bh=xvnaEB3WbuHAEr+o06swJzcGwu2o+Z15ZMsx8gl7EXI=; b=J
	r9kxChT0pV1ldYZ6LVIy4lO7x7/yubc+4pMsL0KNatTkj4WrhC0IIV8Hixb7KKcW
	S/ryav9uTLoWN7htDSfyAbRUzGvJ9uSY4d0QcYJ7MaEdV9CYcSbx0PNLGOO1zJuj
	5e31SqyWcvgZknNM/rAFwpBM3EzvqzSr9QMpoF3duLNLz5FGa2x/Ra+C2qK4ChGe
	YLACzB/TKmqkCxJgmwGNfjF4obXPQvIhERnKuRx3w6S9JYwHRF5KoJRejB5r/HJR
	2gBRpn0DNXJRWaEvF2zCQ3INqUdSUiCE8kVl0TBFwcLQJjc5xQWkuQVBZvC9O+x9
	xnQjVOYeHNuZZtO8Txw/w==
X-ME-Sender: <xms:bdDnaSUisUsS9ju5WDc7W0CegCf471qr5rFUUaw2fMUk1phKb1P7Zg>
    <xme:bdDnaZabw8pwVXb5ZlSKjxvpbc00M5Zb0Ma0Ol2J0M7kp-dLgXIWS5zImsFAfLnJC
    VictxhHa3-XGlZ1rKTwp8rSwDkJHfNLXCQVxe1h5-0oGZNdKa1aDmY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeivddvgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpedvhfdvkeeuudevfffftefgvdevfedvleehvddvgeejvdefhedtgeegveehfeeljeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeekpdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopehmihhguhgvlhdrohhjvggurgdrshgrnhguohhnihhssehgmhgrihhlrd
    gtohhmpdhrtghpthhtohepughvhihukhhovhesghhoohhglhgvrdgtohhmpdhrtghpthht
    ohepvghlvhgvrhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepkhgrshgrnhdquggvvh
    esghhoohhglhgvghhrohhuphhsrdgtohhmpdhrtghpthhtohepnhgrthhhrghnsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopehllhhvmheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhn
    uhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:bdDnaY0kDmzsR9D0ZMcr7b1BOCkoZ1IPgR_YqVgtr6B21ed9fj_hvA>
    <xmx:bdDnafE7kI_Xiy12Q_LBGXhCusnQEo0Qf7qe9F9HKxHSwLb51QJs4A>
    <xmx:bdDnaTFcM3mM3ukt8L5rFFYvyeEhETVEbDmbkwC90jS9a7f6NhN9rA>
    <xmx:bdDnaS4nkm1dgWbvtDikJSYWMEg1wjtEpVabEnC4nrsHYbaNwnJYkg>
    <xmx:bdDnaYKRvDeAa5CSkS7SMNbJGyzNc7Bsw13T5xiz-N-bn3do9TDmWdqe>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2EF2A700065; Tue, 21 Apr 2026 15:30:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AzKWF4Bi_gH-
Date: Tue, 21 Apr 2026 21:30:17 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Marco Elver" <elver@google.com>,
 "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Cc: kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org,
 "Miguel Ojeda" <ojeda@kernel.org>, "Dmitry Vyukov" <dvyukov@google.com>,
 "Nathan Chancellor" <nathan@kernel.org>, llvm@lists.linux.dev
Message-Id: <63e461c3-2d8e-47c0-9901-34b53e53f22b@app.fastmail.com>
In-Reply-To: 
 <CANpmjNPiyXdQnEXw=YbCrj4R5+8CvzNPX+C4gNaqW0Kjj2-k5A@mail.gmail.com>
References: <20260421190351.1976329-1-elver@google.com>
 <CANiq72=45YiMnJiX-73gc7Y6tVTs3fzmVDQ4WdRBQcgqesYFAw@mail.gmail.com>
 <CANpmjNPiyXdQnEXw=YbCrj4R5+8CvzNPX+C4gNaqW0Kjj2-k5A@mail.gmail.com>
Subject: Re: [PATCH 1/2] Compiler Attributes: Add __access macro
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026, at 21:20, Marco Elver wrote:
> On Tue, 21 Apr 2026 at 21:15, Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
>>
>> On Tue, Apr 21, 2026 at 9:04=E2=80=AFPM Marco Elver <elver@google.com=
> wrote:
>> >
>> > Add support for the `__access__` attribute, which is supported sinc=
e gcc
>> > >=3D 11 but not currently supported by clang.
>>
>> > + * Optional: only supported since gcc >=3D 11
>>
>> From a quick try in Compiler Explorer, it seems GCC recognizes it
>> starting with GCC 10 rather than 11. It also seems to be in the docs.
>> Is there a reason for the 11?
>
> Oh, will fix. In the original report by Arnd we somehow concluded it
> was 11, but I guess I should double check such things. :-)

gcc-10 knows the 'access' attribute, but not the 'none' variant:

echo 'int f(void *p) __attribute__((access(none, 1)));' | /home/arnd/cro=
ss/arm64/gcc-10.5.0-nolibc/aarch64-linux/bin/aarch64-linux-gcc  -xc - -o=
 /dev/null  -c
<stdin>:1:1: error: attribute 'access' invalid mode 'none'; expected one=
 of 'read_only', 'read_write', or 'write_only'

      Arnd
