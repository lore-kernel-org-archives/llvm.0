Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E8B628
	for <llvm@lists.linux.dev>; Thu,  8 Jun 2023 07:57:21 +0000 (UTC)
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20230608075058epoutp0318c50125443726bb20b021e2c5feca1f~mn6kK_uac0314103141epoutp03X
	for <llvm@lists.linux.dev>; Thu,  8 Jun 2023 07:50:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20230608075058epoutp0318c50125443726bb20b021e2c5feca1f~mn6kK_uac0314103141epoutp03X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1686210658;
	bh=HJppTh4hNx/lcCe0c2zXtHzte8UoSXTnYqenZDXOec4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=CdQbIt/RSP+03E4O1kD/WZP0NdxpYzT1dwQ3jAJcACyEW8nvyytXNe+abvl1Wvzyi
	 Vd/9Y4MMx1mK20sQYf9GfRoEv9xZ6NdvMoNWFirBVX6//jYnpdE11N86fWYdAhPbqc
	 aLjIDJk7G3OiQPnduAMsz+stHad9tw7ldSDE1O8U=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas1p2.samsung.com (KnoxPortal) with ESMTP id
	20230608075058epcas1p208b63cbbb4dec4c9cf2a976c8643abd6~mn6jrHY981980819808epcas1p2n;
	Thu,  8 Jun 2023 07:50:58 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.38.236]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4QcGc11J1mz4x9Q9; Thu,  8 Jun
	2023 07:50:57 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
	epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
	21.FB.48553.16881846; Thu,  8 Jun 2023 16:50:57 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
	20230608075056epcas1p498e31886d0eb6243db5aec32603ae762~mn6h-Hvjh1909019090epcas1p47;
	Thu,  8 Jun 2023 07:50:56 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20230608075056epsmtrp26e8294f529a4d25bf724b1bfa581fff3~mn6h7czUv3003730037epsmtrp2W;
	Thu,  8 Jun 2023 07:50:56 +0000 (GMT)
X-AuditID: b6c32a39-509937000001bda9-4e-64818861c066
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	61.8A.27706.06881846; Thu,  8 Jun 2023 16:50:56 +0900 (KST)
Received: from kson001 (unknown [10.102.7.58]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20230608075056epsmtip1ad0ca5eaf3a865ba893b0cceb3a5da06~mn6hma8Tj0289902899epsmtip1R;
	Thu,  8 Jun 2023 07:50:56 +0000 (GMT)
From: "Kwanghoon Son" <k.son@samsung.com>
To: "'Conor Dooley'" <conor.dooley@microchip.com>,
	<linux-riscv@lists.infradead.org>
Cc: <conor@kernel.org>, "'Miguel Ojeda'" <ojeda@kernel.org>, "'Alex Gaynor'"
	<alex.gaynor@gmail.com>, "'Wedson Almeida Filho'" <wedsonaf@gmail.com>,
	"'Boqun	Feng'" <boqun.feng@gmail.com>, "'Gary Guo'" <gary@garyguo.net>,
	=?utf-8?Q?'Bj=C3=B6rn_Roy_Baron'?= <bjorn3_gh@protonmail.com>, "'Jonathan
 Corbet'" <corbet@lwn.net>, "'Paul Walmsley'" <paul.walmsley@sifive.com>,
	"'Palmer	Dabbelt'" <palmer@dabbelt.com>, "'Nathan Chancellor'"
	<nathan@kernel.org>, "'Nick	Desaulniers'" <ndesaulniers@google.com>, "'Tom
 Rix'" <trix@redhat.com>, <rust-for-linux@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<llvm@lists.linux.dev>
In-Reply-To: <20230608-dispatch-sneer-aa09bd7b2eb8@wendy>
Subject: RE: [PATCH v1 0/2] RISC-V: enable rust
Date: Thu, 8 Jun 2023 16:50:55 +0900
Message-ID: <000001d999dd$f5166cd0$df434670$@samsung.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFxm6qKyBFRC1seLjkBq1pGYFP2NAEpdoRnAm01MviwM83LIA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrBJsWRmVeSWpSXmKPExsWy7bCmnm5iR2OKwdwfLBZ/Z29nt7hxYT+z
	xZotjUwWUzbtYLdYOXUVm8WTA+2MFhfPvGa0WNi2hMXi8q45bBbbPrcAJabsZ7NoX/mUzeLD
	hP9MFivnL2e0eHm5h9mibRa/xfpnh5ktrn05zWKxYdlaRgdhjzcvX7J4LOn8xeSxc9Zddo8F
	m0o9Nq3qZPPYvKTe48XmmYwei/sms3rc+bGU0aOnbROTx/t9V9k8LjVfZ/f4vEkugDcq2yYj
	NTEltUghNS85PyUzL91WyTs43jne1MzAUNfQ0sJcSSEvMTfVVsnFJ0DXLTMH6E8lhbLEnFKg
	UEBicbGSvp1NUX5pSapCRn5xia1SakFKToFpgV5xYm5xaV66Xl5qiZWhgYGRKVBhQnbGsq+d
	LAVfOSq2v3rM3MD4m62LkZNDQsBE4tf0U8xdjFwcQgI7GCUaZkxgg3A+MUp07l3NAuF8Y5Q4
	cfoQXMvnTR8ZIRJ7GSUmP5/BDuE8ZpSY8vsxM0gVm4CmxMJzvxlBbBGBMIlJvc/BljALzGKV
	mPvyCStIglPAUqLn+X+wBmEBfYmbO/6ArWARUJE4c/ElWJwXqOZZ93o2CFtQ4uTMJywgNrOA
	vMT2t3OYIU5SkPj5dBkrxDIniYVLdjJC1IhIzO5sg6qZzylxd2EkhO0i8WvVf6i4sMSr41vY
	IWwpic/v9kK9mS1x9COMXSJxfdYiVgjbWGL/0slMXYwcQPM1Jdbv0ocIK0rs/D0Xai2fxLuv
	PawgJRICvBIdbUIQprzErc5yiGpRiTNPP7JNYFSaheSvWUj+moXk/lkIuxYwsqxiFEstKM5N
	Ty02LDCFR3Zyfu4mRnAW0LLcwTj97Qe9Q4xMHIyHGCU4mJVEeLPs61OEeFMSK6tSi/Lji0pz
	UosPMZoCQ3ois5Rocj4wD+WVxBuaWBqYmBkZm1gYmhkqifN+eaqdIiSQnliSmp2aWpBaBNPH
	xMEp1cDkN63p/vE5lvLC9n6M5xoz5Bq23Vb1++DzeFkwQxm7dfSyq5UsOXxT//30/tNZuO/m
	u/63y3e8Ur7sI5J5c96c1fP4AxxfyZR0CS19wpbir3x2U8u2uFPiYkJcEdyL/TSzlou88jXY
	97sypGKT9HMj35qrR5R0ewoP+bPzLLr3uodlD9N9L8Xfh+dGOIsmmwX6fNnArHru8aGCsAvP
	unTVj7zYKp3Umbj+OHPwBpNnm6rYnPpdylqvtkx8UHGO31nFcGKvAQ/va7bPbzX7XoanPnu1
	5HuxanlipVthQvRpz79MAZOM59qG3m6Rvm/W06E78dzBDPbp1a+5pR5wLHr/T41x0lerqS+S
	tTOqspRYijMSDbWYi4oTAc9Ake2LBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKIsWRmVeSWpSXmKPExsWy7bCSnG5CR2OKwdpj4hZ/Z29nt7hxYT+z
	xZotjUwWUzbtYLdYOXUVm8WTA+2MFhfPvGa0WNi2hMXi8q45bBbbPrcAJabsZ7NoX/mUzeLD
	hP9MFivnL2e0eHm5h9mibRa/xfpnh5ktrn05zWKxYdlaRgdhjzcvX7J4LOn8xeSxc9Zddo8F
	m0o9Nq3qZPPYvKTe48XmmYwei/sms3rc+bGU0aOnbROTx/t9V9k8LjVfZ/f4vEkugDeKyyYl
	NSezLLVI3y6BK2PZ106Wgq8cFdtfPWZuYPzN1sXIySEhYCLxedNHxi5GLg4hgd2MEvOapjJD
	JEQlOi43AiU4gGxhicOHiyFqHjJKbJ86A6yZTUBTYuG534wgtohAmMSk3ufMIEXMAitYJe7P
	O8oC0bGPUWLN7k9gHZwClhI9z/+DbRAW0Je4ueMPWJxFQEXizMWXYHFeoJpn3evZIGxBiZMz
	n7CA2MwC2hJPbz6FsuUltr+dA3WpgsTPp8tYIa5wkli4ZCcjRI2IxOzONuYJjMKzkIyahWTU
	LCSjZiFpWcDIsopRMrWgODc9t9iwwDAvtVyvODG3uDQvXS85P3cTIzglaGnuYNy+6oPeIUYm
	DsZDjBIczEoivFn29SlCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeS90nYwXEkhPLEnNTk0tSC2C
	yTJxcEo1MJ3bs+47m8h52QUPz7xcpJDifklJV17S3Xz2sXzHOLXM5px1HFVzrt+zz/4kZVWS
	YWTXcTox0PKAs8tjJqN4xxXpVTF30/tLvExDXXcXz9kRabv6nbSZ3mbhX1v9Ch0eLBVbxb5u
	+o36zv65q0PdJiXd/pVi27DoG9+52qrM9o+r8z6lZLafj5a+xpF/a4KqlF7/rYqNwr57ds97
	8nSl7zFRr6zpE2L3Hnb1tfcos/3xxenxDsNaHp/fbwoZnzzSmTonNyx+p/OLgoXT+GZkXvOv
	EXjy6OD0Ylm3r4z125jVrx7qMTPJeOphf3t/W3b6sgs/Xs8/ph2yVdU06fCls2q9V8srr/2Z
	9FVhVctKGyWW4oxEQy3mouJEAFHOyo14AwAA
X-CMS-MailID: 20230608075056epcas1p498e31886d0eb6243db5aec32603ae762
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230608070229epcas1p1aeafe28fca0bd682585c4115670d7cc9
References: <20230307102441.94417-1-conor.dooley@microchip.com>
	<CGME20230608070229epcas1p1aeafe28fca0bd682585c4115670d7cc9@epcas1p1.samsung.com>
	<20230608-dispatch-sneer-aa09bd7b2eb8@wendy>

> Hey Kwang,
> 
> > Hi,
> > Recently I'm trying to put a rust patch on the risc-v board.
> > I saw a patch [1] and looked through it roughly.
> > Only if llvm(not gcc) is allowed, it looks good with no major problems.
> >
> > > I'll revisit this when my thoughts have settled down.
> >
> > If you let me know the problematic part, may I try the patch?
> >
> > [1] https://lore.kernel.org/linux-riscv/20230405-itinerary-handgrip-
> > a5ffba368148@spud/
> 
> Yeah, you can definitely try this or the downstream rust-for-linux
> project - both should work well on RISC-V.
> The problematic part is figuring out what ISA extensions are supported
> by the rust compiler being used (and by bindgen), and deciding what to
> put in -march as a result.
> 
> I think it is unlikely to matter for you, unless you're aggressively
> mixing versions for different parts of your toolchain.
> 
> I do intend revisting this, probably after the min. version for rust
> gets bumped, I've just been really busy with other work the last weeks.

No rush! I was just curious.
Thank you for the explanation!

> 
> Cheers,
> Conor.

