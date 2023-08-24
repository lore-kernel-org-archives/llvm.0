Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C3A28917
	for <llvm@lists.linux.dev>; Thu, 24 Aug 2023 18:05:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94152C433C8;
	Thu, 24 Aug 2023 18:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692900318;
	bh=b9Y4MPFolNjzn4rKwTbXRHQYatnX1u3FmDMhr2r9dz8=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=DfHVNSb5f04gpIp928ey9FDQppV9g16cxcCFbnmXLlzczV5Fr+m7iOZdD7NqfcnRr
	 jssafJzN3XCx7hMfYdBJ940V0KyasdFVTPIuylav+O153GUVHKylaA/Ja7l1Au6R4A
	 oIp2gev0SB+akKLnOOE8eDC7UEucEfPR6DlyDghDEV0+tTE2pHpq8/zxObGFf808Tw
	 wnL2MX0pTMGpsWPdDXEhLkLOfRYba7863JBLMANK8nqAthlHrmT9jF86A8jAZs40LX
	 GhY1yeWL4KALL9EuVn4TGJMkY8tSHhc72uHitMzFoLJatnVQJVCoy2f114QDwmew1Q
	 1AvL7+ZCgoXeQ==
Date: Thu, 24 Aug 2023 19:05:13 +0100
From: Conor Dooley <conor@kernel.org>
To: Mingzheng Xing <xingmingzheng@iscas.ac.cn>
List-Id: <linux-riscv.lore.kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	patchwork-bot+linux-riscv@kernel.org,
	linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, nathan@kernel.org,
	ndesaulniers@google.com, trix@redhat.com, bmeng@tinylab.org,
	guoren@kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH v5] riscv: Handle zicsr/zifencei issue between gcc and
 binutils
Message-ID: <20230824-cortex-mobilize-8b94e059e130@spud>
References: <20230809165648.21071-1-xingmingzheng@iscas.ac.cn>
 <169228562484.20811.14246462375671910714.git-patchwork-notify@kernel.org>
 <20230823-captive-abdomen-befd942a4a73@wendy>
 <20230823-facelift-ovary-41f2eb4d9eac@spud>
 <4677fc33-6e76-21e6-2a7f-f12670bc1ce2@iscas.ac.cn>
 <4177c0c5-4d36-75e1-84e2-c6ac82b74e50@iscas.ac.cn>
 <20230824-stick-neutron-839dfdfa0538@spud>
 <3ba51c81-7eca-b1b5-c89d-47b292b65641@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="U02fYEvSEIMc9kCR"
Content-Disposition: inline
In-Reply-To: <3ba51c81-7eca-b1b5-c89d-47b292b65641@iscas.ac.cn>


--U02fYEvSEIMc9kCR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 25, 2023 at 01:46:59AM +0800, Mingzheng Xing wrote:

> Just a question, I see that the previous patch has been merged
> into 6.5-rc7, and now a new fix patch should be sent out based
> on that, right?

yes

--U02fYEvSEIMc9kCR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZOeb2QAKCRB4tDGHoIJi
0vDMAQCzGNlPBZZkzPnogVAMPBEN/UWcLLDix5fK5GC8O/NBdgD9Eq02Jx3LLTHQ
NQ7boHcY0bsiLyHDYsoS6SSG921AbgI=
=nZ9V
-----END PGP SIGNATURE-----

--U02fYEvSEIMc9kCR--
