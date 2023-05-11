Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC29581F
	for <llvm@lists.linux.dev>; Thu, 11 May 2023 07:19:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 732CFC4339C
	for <llvm@lists.linux.dev>; Thu, 11 May 2023 07:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683789547;
	bh=3erEDwnU6Z+y9MSYMDXl9B9JbEFOWTS3rYUWLr0l0T4=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
	b=R5qUHbcIIwqZNdW4V6J0zIHgksAbkZox/rNxmkAbhH3SDJAfj8LhryOkrHpjrNKfA
	 ZJRos9I51pESLV/sfcIgcs1WgcwRHsPfE2K/WtaPW52cjdZjeZkS/0sbnvcLlv9duN
	 yy1VVxPk84GcoG1lrg/AOXTjogE0JVejVjY3rw+vNJ+gK9x95XbxsBljoQYAzPaqni
	 sJKZGQcXXXOUoMFd5sRn/xnxtEmvEufGO40w4i1rM3PXm12QnNeVJl2ElLctv8THEG
	 P/sIryM1B+b94rY8ZG0J3p1ui0WRKSaHhASjOiQYxtoO4y5FRLC5Y4KXrdywUmmsVX
	 kOGNUWrvcG/GA==
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailauth.nyi.internal (Postfix) with ESMTP id 05B1327C0054;
	Thu, 11 May 2023 03:19:05 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 11 May 2023 03:19:06 -0400
X-ME-Sender: <xms:6ZZcZMGaSk8OdDRHJvwcuiVb6_ZnEV9EBYnkgaDZXWdJoX8zZxrx6w>
    <xme:6ZZcZFVmrxkkoF5NW3GAjLFqL3SGsS1Mac9dwv1WiaD-2A3ASvGobX5Xq3qXN47UI
    czjuaJ4cl0Z4-gVgYU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeegjedguddukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugeskhgvrhhnvghlrdhorhhgqeenucggtf
    frrghtthgvrhhnpedvveeigfetudegveeiledvgfevuedvgfetgeefieeijeejffeggeeh
    udegtdevheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrrhhnugdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidquddvkeehudej
    tddvgedqvdekjedttddvieegqdgrrhhnugeppehkvghrnhgvlhdrohhrghesrghrnhgusg
    druggv
X-ME-Proxy: <xmx:6ZZcZGJIW4nq3jh4KL7c_K-MDNMTOKDcenMm3DMp_n0R9Rkv1mAzaw>
    <xmx:6ZZcZOFJIXpSVKnOS7SscLNKw4Lkua59ddievQBYVUUqf6sB8-iNNw>
    <xmx:6ZZcZCVfPF7i6joDsjb74rINdYDYQCgkyCYMWJoXg1epowaexPcNrg>
    <xmx:6ZZcZFdQCfPXjKiCL9pFDabk1xj93GEcqpWlvx2LrlGShuD2jJe6Lw>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id A9C51B60086; Thu, 11 May 2023 03:19:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-415-gf2b17fe6c3-fm-20230503.001-gf2b17fe6
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <c02dc902-4e86-45ea-841a-c45e5623ee54@app.fastmail.com>
In-Reply-To: <202305111015.BDgHTEHP-lkp@intel.com>
References: <202305111015.BDgHTEHP-lkp@intel.com>
Date: Thu, 11 May 2023 09:18:44 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "kernel test robot" <lkp@intel.com>,
 "Niklas Schnelle" <schnelle@linux.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [niks:has_ioport_v4 41/41] lib/iomap.c:81:23: error: call to '_inb'
 declared with 'error' attribute: inb()) requires CONFIG_HAS_IOPORT
Content-Type: text/plain

On Thu, May 11, 2023, at 04:39, kernel test robot wrote:

>
>>> lib/iomap.c:81:23: error: call to '_inb' declared with 'error' attribute: inb()) requires CONFIG_HAS_IOPORT
>            IO_COND(addr, return inb(port), return readb(addr));
>                                 ^

CONFIG_GENERIC_IOMAP requires CONFIG_HAS_IOPORT. I think the correct
fix is to drop the 'select GENERIC_IOMAP' from hexagon.

     Arnd
