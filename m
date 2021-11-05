Received: from deadmen.hmeau.com (helcar.hmeau.com [216.24.177.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7637468
	for <llvm@lists.linux.dev>; Fri,  5 Nov 2021 07:26:41 +0000 (UTC)
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
	by deadmen.hmeau.com with esmtp (Exim 4.92 #5 (Debian))
	id 1mitcB-0004IH-Kb; Fri, 05 Nov 2021 15:26:19 +0800
Received: from herbert by gondobar with local (Exim 4.92)
	(envelope-from <herbert@gondor.apana.org.au>)
	id 1mitc0-0003Xg-Hv; Fri, 05 Nov 2021 15:26:08 +0800
Date: Fri, 5 Nov 2021 15:26:08 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Ido Schimmel <idosch@idosch.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Damien Le Moal <Damien.LeMoal@wdc.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	Vladis Dronov <vdronov@redhat.com>, Simo Sorce <ssorce@redhat.com>,
	Eric Biggers <ebiggers@kernel.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	kernel test robot <lkp@intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: crypto: api - Fix boot-up crash when crypto manager is disabled
Message-ID: <20211105072608.GA13584@gondor.apana.org.au>
References: <20211003002801.GA5435@gondor.apana.org.au>
 <YV0K+EbrAqDdw2vp@archlinux-ax161>
 <20211019132802.GA14233@gondor.apana.org.au>
 <alpine.DEB.2.22.394.2111021636040.2330984@ramsan.of.borg>
 <DM6PR04MB708155E447FD9A79AB89686DE78D9@DM6PR04MB7081.namprd04.prod.outlook.com>
 <CAMuHMdW1wLAt9Y=-GMMuk8HWE3UnRgKNMmD9fq34Rq8J7QyrzQ@mail.gmail.com>
 <20211104121612.GA8044@gondor.apana.org.au>
 <CAMuHMdWAAWWS+TgeN1AajHBS5w9-datMEeXqAN8RjxRd9bX63Q@mail.gmail.com>
 <20211104133044.GA8563@gondor.apana.org.au>
 <YYP5ypSPOcP4WGCr@shredder>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YYP5ypSPOcP4WGCr@shredder>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, Nov 04, 2021 at 05:18:34PM +0200, Ido Schimmel wrote:
>
> Attached my config. I can easily test patches.

Thanks!

Could you all try this patch please?

---8<---
When the crypto manager is disabled, we need to explicitly set
the crypto algorithms' tested status so that they can be used.

Fixes: cad439fc040e ("crypto: api - Do not create test larvals if...")
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reported-by: Ido Schimmel <idosch@idosch.org>
Reported-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/crypto/algapi.c b/crypto/algapi.c
index d379fd91fb7b..a366cb3e8aa1 100644
--- a/crypto/algapi.c
+++ b/crypto/algapi.c
@@ -284,6 +284,8 @@ static struct crypto_larval *__crypto_register_alg(struct crypto_alg *alg)
 
 	if (larval)
 		list_add(&larval->alg.cra_list, &crypto_alg_list);
+	else
+		alg->cra_flags |= CRYPTO_ALG_TESTED;
 
 	crypto_stats_init(alg);
 
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
