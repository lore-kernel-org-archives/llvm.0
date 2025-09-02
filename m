Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC9E532779E;
	Tue,  2 Sep 2025 17:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756835438; cv=none; b=nJB05sxsoOgIL4a8h9dfQA2nDFEigBqcHkqL7uWy5vyt0/WHlFErnvz0eqWS+GBIzOixBI9Zy+H6Y7ed7DLLHhIA3ge+IsD+MldAAU79BPDvwF/GU+W7iLCGW3JbDelPmYNUPP8970NXhn/GWxlF+w5/1t4N+TZTSspkKO+UZYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756835438; c=relaxed/simple;
	bh=Aq1WnnougfqYGW5u50W1ElCIH6JBPnqu0IRamuLPR9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U0NHCBOfjrEMSOvjD229ygGueucS6kRdMwWmqT9sLzlf2ynVwuFZ7CUgPK7cakhzg6ZLCGeSSPdhFVu72SI1Tq4gyS+U7gw7k2DBvYxHV8dUkUXPklw9Vt/RH9gScxnIGgL4ekLWtUnI1JbyWeVTTefsEkfjRaZ0fvWfOvKn8xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cGXlY69KQz9sRy;
	Tue,  2 Sep 2025 19:28:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YhglP0DjrnDx; Tue,  2 Sep 2025 19:28:41 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cGXlY56Rkz9sRk;
	Tue,  2 Sep 2025 19:28:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 90E0F8B796;
	Tue,  2 Sep 2025 19:28:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id ohauBnR9cmAj; Tue,  2 Sep 2025 19:28:41 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3DD868B77B;
	Tue,  2 Sep 2025 19:28:41 +0200 (CEST)
Message-ID: <df5573d5-e133-4b76-9a5b-d9c98f4e1e96@csgroup.eu>
Date: Tue, 2 Sep 2025 19:28:41 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/7] soc: fsl: qe: Add support of IRQ in QE GPIO
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
References: <1234b2b7105443654c5f2bb97d25cf16408d6003.1756727747.git.christophe.leroy@csgroup.eu>
 <202509021830.uakzVIlK-lkp@intel.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <202509021830.uakzVIlK-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 02/09/2025 à 12:50, kernel test robot a écrit :
> Hi Christophe,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on robh/for-next]
> [also build test WARNING on powerpc/next powerpc/fixes linus/master v6.17-rc4]
> [cannot apply to next-20250902]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit-scm.com%2Fdocs%2Fgit-format-patch%23_base_tree_information&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Ca3ddcbd613fd48271bba08ddea0eb403%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638924071075803525%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=%2BniURYrufRzhFQ7KXwgpmnJIfeJWcTMavXkEndbtHYA%3D&reserved=0]
> 
> url:    https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fintel-lab-lkp%2Flinux%2Fcommits%2FChristophe-Leroy%2Fsoc-fsl-qe-Add-an-interrupt-controller-for-QUICC-Engine-Ports%2F20250901-202447&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Ca3ddcbd613fd48271bba08ddea0eb403%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638924071075825139%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=v43MiEVTfpflIobzhrSvzs4IZcmfHuSrXyUJHafSLNk%3D&reserved=0
> base:   https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Frobh%2Flinux.git&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Ca3ddcbd613fd48271bba08ddea0eb403%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638924071075840967%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=g1r1XaGeDG5nZqIU1b61fCZlve9VQaMIliHoufnXFLU%3D&reserved=0 for-next
> patch link:    https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fr%2F1234b2b7105443654c5f2bb97d25cf16408d6003.1756727747.git.christophe.leroy%2540csgroup.eu&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Ca3ddcbd613fd48271bba08ddea0eb403%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638924071075856717%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=BWYYNgbEu2UZWOS8XRlq%2FdGddmBDeQ%2BjDb%2FIorMXSmc%3D&reserved=0
> patch subject: [PATCH v5 4/7] soc: fsl: qe: Add support of IRQ in QE GPIO
> config: powerpc64-randconfig-003-20250902 (https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdownload.01.org%2F0day-ci%2Farchive%2F20250902%2F202509021830.uakzVIlK-lkp%40intel.com%2Fconfig&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Ca3ddcbd613fd48271bba08ddea0eb403%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638924071075872388%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=M6TMS23JmgSVi3aQZDvjZcOn9vX7HyUc8%2BcoLOjfN6E%3D&reserved=0)
> compiler: clang version 22.0.0git (https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fllvm%2Fllvm-project&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Ca3ddcbd613fd48271bba08ddea0eb403%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638924071075888080%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3uIHxd8uhuDUbQRCQbcW%2BFnR1uvJZeN3AQWOR039L7A%3D&reserved=0 2e122990391b2ba062e6308a12cfedf7206270ba)
> reproduce (this is a W=1 build): (https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdownload.01.org%2F0day-ci%2Farchive%2F20250902%2F202509021830.uakzVIlK-lkp%40intel.com%2Freproduce&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Ca3ddcbd613fd48271bba08ddea0eb403%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638924071075903628%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=y13g2bKm6FrjWSiErSO83akrf3BclbaIQ4142F9f5Tk%3D&reserved=0)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Foe-kbuild-all%2F202509021830.uakzVIlK-lkp%40intel.com%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Ca3ddcbd613fd48271bba08ddea0eb403%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638924071075921207%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=j%2BMDWBvsHHtgzjiHc83gr3OguP22jVJ41AmVgFtT6eM%3D&reserved=0
> 
> All warnings (new ones prefixed by >>):
> 
>     In file included from <built-in>:3:
>     In file included from include/linux/compiler_types.h:171:
>     include/linux/compiler-clang.h:37:9: warning: '__SANITIZE_THREAD__' macro redefined [-Wmacro-redefined]
>        37 | #define __SANITIZE_THREAD__
>           |         ^
>     <built-in>:352:9: note: previous definition is here
>       352 | #define __SANITIZE_THREAD__ 1
>           |         ^
>>> drivers/soc/fsl/qe/gpio.c:316:9: warning: cast to smaller integer type 'u32' (aka 'unsigned int') from 'const void *' [-Wvoid-pointer-to-int-cast]
>       316 |         mask = (u32)of_device_get_match_data(dev);
>           |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     2 warnings generated.
> 


Will be fixed with the following change in the patch:

diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
index 8632b0d37255..7a23eb220217 100644
--- a/drivers/soc/fsl/qe/gpio.c
+++ b/drivers/soc/fsl/qe/gpio.c
@@ -305,7 +305,7 @@ static int qe_gpio_probe(struct platform_device *ofdev)
  	struct device_node *np = dev->of_node;
  	struct qe_gpio_chip *qe_gc;
  	struct gpio_chip *gc;
-	u32 mask;
+	unsigned long mask;

  	qe_gc = devm_kzalloc(dev, sizeof(*qe_gc), GFP_KERNEL);
  	if (!qe_gc)
@@ -313,7 +313,7 @@ static int qe_gpio_probe(struct platform_device *ofdev)

  	spin_lock_init(&qe_gc->lock);

-	mask = (u32)of_device_get_match_data(dev);
+	mask = (unsigned long)of_device_get_match_data(dev);
  	if (mask) {
  		int i, j;


