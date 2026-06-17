Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B445249EB
	for <llvm@lists.linux.dev>; Wed, 17 Jun 2026 23:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781739132; cv=none; b=TOiZF4KoGWf1iBAXW8dXEvlKsGhYTjkaVsASbmboJ/V1e5dF1/beAiKrSvaSf5PLK06XdRKXMePGo6ISXH4bkNAEblYCq3gTL5l2Bssaki5WisMJLpbMGIFW5835POQ1blTSqEd2WH642B5oVVJgcdakC61R9S4Y3ncnwghgVgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781739132; c=relaxed/simple;
	bh=38JllE3s/y5D//mlFml9uZbIk75XRsdgofyH7W2BDyg=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=hzQKUzwygZOcuKNaj0DeBIYvLBWHqcNlCcdn42Ss7KIhZ5tVmk7xLDzaGKhA0AFjfIs9o54Ea6rF1FiSidcLvETsH4xtsC0RLADEWkVm9/RfX1VZ1hLN2+mb7TiIQ1dQoGNUoGrgGVaqUtNMrec3irqhURgtDXxU8ZgkZsgo7h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ADsT8wvA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ADsT8wvA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781739130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CEuSjw1vkxKCzy31Y9UDyyI9PoT94ujxV4aBDEXxjxk=;
	b=ADsT8wvAvVWk7TyB4/CPtCz7G6n7HMCI2Pcqnu7C+6YHU1r1SI2DgtxdV9QvzrL7jXXup8
	+IvOVbLLeS7oa930touhoqUxVdDtjEkDtydRVlSRBCY741dve4dSMUi1D0Ecxm7Tv9rfVI
	me5o8vL07Pi3z6XdauLpWRnHnQ16cHw=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-613-0qdQC_7_PpSfoPwAgvHoGA-1; Wed,
 17 Jun 2026 19:32:08 -0400
X-MC-Unique: 0qdQC_7_PpSfoPwAgvHoGA-1
X-Mimecast-MFC-AGG-ID: 0qdQC_7_PpSfoPwAgvHoGA_1781739128
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BDD001955F2D
	for <llvm@lists.linux.dev>; Wed, 17 Jun 2026 23:32:07 +0000 (UTC)
Received: from [172.20.152.42] (unknown [10.30.45.46])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4D99419560A2;
	Wed, 17 Jun 2026 23:32:07 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.1.0-0,
 upstream-mainline, 4b99990c)
Date: Wed, 17 Jun 2026 23:32:06 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <74790.126061719320801134@us-mta-613.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZLCPP4NRfTPc8tyqQ5bkbCLVV0NFySRia1I511_GWHs_1781739128
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'drm-next-2026-06-17' of https://gitlab.freed=
esktop.org/drm/kernel

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2608007695

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2608007695_ppc64le_kernel

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: avc: denied { create } for comm=3D"rpc.mountd"
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2456368
            Affected tests:
                xfstests - nfsv4.2 [x86_64]



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

