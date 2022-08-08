Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981CA7A
	for <llvm@lists.linux.dev>; Mon,  8 Aug 2022 18:33:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F40CC433D7;
	Mon,  8 Aug 2022 18:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659983618;
	bh=D2XW8J2IVrVhTm9qso0bSI1eB34b3POF3YjI53CNJj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m9TCF1LblgMJD9S1VkUE1pBE+IEXHKG5gTnWhHoVjYzgmUxhwaysmPAQvRofn/80w
	 RyDEbWSMcg77uqD8/ygAOFo6i+JcrqbhmrB+sIHzc4iFNGLTsy7Bhuq08Txqm92O8j
	 +jsZ13tpScJr+DjRmevGyqJQMs4jUiSYh4RhL/Kk7NuokDsjucHxnXHojQxOAoRn2l
	 mk25fUHPE5q6IvRDFkA4u2JFjEXXo/7/5ZP0unvdPkEvRR3trTvmrwMPIIZM2fG7vb
	 oDgJ1YM4frZ6AU3rMsdAhwx02Ea7pU8U1mIoDduRDaISAM8rHn90yNplMy+c/vRZJK
	 T+FQ+5abhb/fg==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id F27384035A; Mon,  8 Aug 2022 15:33:34 -0300 (-03)
Date: Mon, 8 Aug 2022 15:33:34 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: Roberto Sassu <roberto.sassu@huawei.com>, quentin@isovalent.com,
	ast@kernel.org, andrii@kernel.org, martin.lau@linux.dev,
	song@kernel.org, john.fastabend@gmail.com, kpsingh@kernel.org,
	sdf@google.com, peterz@infradead.org, mingo@redhat.com,
	terrelln@fb.com, nathan@kernel.org, ndesaulniers@google.com,
	bpf@vger.kernel.org, linux-perf-users@vger.kernel.org,
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] build: Switch to new openssl API for test-libcrypto
Message-ID: <YvFW/kBL6YA3Tlnc@kernel.org>
References: <20220719170555.2576993-1-roberto.sassu@huawei.com>
 <20220719170555.2576993-4-roberto.sassu@huawei.com>
 <5f867295-10d2-0085-d1dc-051f56e7136a@iogearbox.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f867295-10d2-0085-d1dc-051f56e7136a@iogearbox.net>
X-Url: http://acmel.wordpress.com

Em Mon, Aug 08, 2022 at 06:14:48PM +0200, Daniel Borkmann escreveu:
> Hi Arnaldo,
> 
> On 7/19/22 7:05 PM, Roberto Sassu wrote:
> > Switch to new EVP API for detecting libcrypto, as Fedora 36 returns an
> > error when it encounters the deprecated function MD5_Init() and the others.
> > The error would be interpreted as missing libcrypto, while in reality it is
> > not.
> > 
> > Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
> 
> Given rest of the tooling fixes from Andres Freund went via perf tree and the
> below is perf related as well, I presume you'll pick this up, too?

Sure.
 
>   [0] https://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git/log/?h=perf/core
> 
> >   tools/build/feature/test-libcrypto.c | 15 +++++++++++----
> >   1 file changed, 11 insertions(+), 4 deletions(-)
> > 
> > diff --git a/tools/build/feature/test-libcrypto.c b/tools/build/feature/test-libcrypto.c
> > index a98174e0569c..bc34a5bbb504 100644
> > --- a/tools/build/feature/test-libcrypto.c
> > +++ b/tools/build/feature/test-libcrypto.c
> > @@ -1,16 +1,23 @@
> >   // SPDX-License-Identifier: GPL-2.0
> > +#include <openssl/evp.h>
> >   #include <openssl/sha.h>
> >   #include <openssl/md5.h>
> >   int main(void)
> >   {
> > -	MD5_CTX context;
> > +	EVP_MD_CTX *mdctx;
> >   	unsigned char md[MD5_DIGEST_LENGTH + SHA_DIGEST_LENGTH];
> >   	unsigned char dat[] = "12345";
> > +	unsigned int digest_len;
> > -	MD5_Init(&context);
> > -	MD5_Update(&context, &dat[0], sizeof(dat));
> > -	MD5_Final(&md[0], &context);
> > +	mdctx = EVP_MD_CTX_new();
> > +	if (!mdctx)
> > +		return 0;
> > +
> > +	EVP_DigestInit_ex(mdctx, EVP_md5(), NULL);
> > +	EVP_DigestUpdate(mdctx, &dat[0], sizeof(dat));
> > +	EVP_DigestFinal_ex(mdctx, &md[0], &digest_len);
> > +	EVP_MD_CTX_free(mdctx);
> >   	SHA1(&dat[0], sizeof(dat), &md[0]);
> > 

-- 

- Arnaldo
