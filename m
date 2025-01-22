Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40FB186A
	for <llvm@lists.linux.dev>; Wed, 22 Jan 2025 03:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737517329; cv=none; b=A935IBd2glZaX+3lOetF+9gDZDgvlGr7eVueLAQByRZGp0FY0LeRjdT88CggNNUAHMBMKQQs24AJMtl/3mPPkIDGklEU4p6Ha/IXcbUf7P7a6oRE/fFHHypGDNV07Qi0I0cOIPKB2+Ui72QyK/vKPwi6CJghkqQmC3KWhvwM51Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737517329; c=relaxed/simple;
	bh=UVPOB3oOPsV4LUViYz1MastKPrrzUzD6ynra0WDNzoo=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=jXjoICAaJQE1l/92KL59hxAYiLH/hNAbJddXOKCsjr+iKnSzPoyK59gPaLUwLLlYbBz4cpJruWh3QA0ObGKnBqoTjYc+aUZmQR3cPb3PLMyH70LQ6l1QgixYNDMuR9dhJ5eJQMK2DFheCuLREJZ13/B/ZlVJwYClHxVry6/NIKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cFOYhQFB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cFOYhQFB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737517326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MeQA/FzzLlg6cyPQuZBqx93Xn5bLitAXAhVQZQIZbtU=;
	b=cFOYhQFB191Paz/s9fBmP5zb7nNH3cGF75GY5n9VMUC9KUz9r32rTLaTPZGgpn+Z4u4s/a
	5fTE81RJxlRVFznWTcxhce1rkOzpcrlgnz9Jkv3RSDUS62Cs38/Zh2eIWJv2qhwI9ZS7qo
	CPISl7CTF/pdL1xCcxm0m/rK4smFmms=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-695-l-ux3GXgNnKQq_hkjnoUvw-1; Tue,
 21 Jan 2025 22:42:05 -0500
X-MC-Unique: l-ux3GXgNnKQq_hkjnoUvw-1
X-Mimecast-MFC-AGG-ID: l-ux3GXgNnKQq_hkjnoUvw
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 909721953946
	for <llvm@lists.linux.dev>; Wed, 22 Jan 2025 03:42:04 +0000 (UTC)
Received: from [172.64.13.55] (unknown [10.30.32.164])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3A452195608E;
	Wed, 22 Jan 2025 03:42:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0,
 upstream-mainline, d0f93ac2)
Date: Wed, 22 Jan 2025 03:42:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <01798.125012122420500328@us-mta-695.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DjTmFqMhyOdv0qiBXN051ahmcmT7IMIXIiLvGFPBi68_1737517324
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'docs-6.14' of git://git.lwn.net/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1635234875

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1635234875-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1635234875-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1635234875-x86_64-kernel
                   Issue: Kernel build: arch/x86/tools/insn_decoder_test: e=
rror: malformed line
                          https://github.com/Rust-for-Linux/linux/issues/11=
34


If you find a failure unrelated to your changes, please ask the test mainta=
iner to review it.
This will prevent the failures from being incorrectly reported in the futur=
e.

Please reply to this email if you have any questions about the tests that w=
e
ran or if you have any suggestions on how to make future tests more effecti=
ve.

        ,-.   ,-.
       ( C ) ( K )  Continuous
        `-',-.`-'   Kernel
          ( I )     Integration
           `-'
___________________________________________________________________________=
___

