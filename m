Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E7838C438
	for <llvm@lists.linux.dev>; Sun, 19 Jul 2026 14:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784471531; cv=none; b=TfIxhGFu2/JCaMlbf8n0ltj0p2ekw8z+EH2/KzVszaiCy0kormISm2shpHlDwtJ5jt2bKnI3zXPZY6ujwSRU6mHEJII2mIeJ8JiS9yETIELA6oAfmcp4SZ4W9LRJW23UEraRUu+/NWApg3a7HZaovKEY/F79tMUhi7AmoeZhVpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784471531; c=relaxed/simple;
	bh=tv5WeYI3++a/GQ2zxUoeG5F5YzYBzmZ6VESlQVGyqfA=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=BBvKqz8JHfU2609QR18mXO11YWrkLneVcQHyMO1w47lVfEHRpiZ+vUf5F82+lzoKl+Kn9C7p0TalD8aTadekcovm5LNghdvCCaygjra/aT02ekqmOeRW9GwPy9LOESertjzTwQIxFx1eucAui9PP8hDIIwYPc0Vkfh+gXVbUGTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bCltOAI5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bCltOAI5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784471529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AOw+l4bFyeGxCtwCIfiINNIUW+z4WFm6QsC7c08L8/Y=;
	b=bCltOAI5DLyiJlGq2F7e/29wOlZ88TTqpGb2po+o9emHaQxhDBKX+K9Kp9DuQjskzKraud
	bTfC653XnePeb8TOI0yK2rwI7M+nPvAGteaZxpjF0p8ZtemX7g7Ip6SHQhOLO5mkMG0i2S
	uPZr0CglACQGrj2W2RbuhxgzbgSF7DI=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-17-ve7hfZiOMtCrH3RE5Ur9MA-1; Sun,
 19 Jul 2026 10:32:08 -0400
X-MC-Unique: ve7hfZiOMtCrH3RE5Ur9MA-1
X-Mimecast-MFC-AGG-ID: ve7hfZiOMtCrH3RE5Ur9MA_1784471527
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 23E4C1944F06
	for <llvm@lists.linux.dev>; Sun, 19 Jul 2026 14:32:07 +0000 (UTC)
Received: from [172.20.159.80] (unknown [10.30.44.85])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C817F300418E;
	Sun, 19 Jul 2026 14:32:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.2.0-rc3,
 upstream-mainline, f2ec6312)
Date: Sun, 19 Jul 2026 14:32:06 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <23682.126071910320800175@us-mta-17.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KxVUBdTLcPll4MRb9jkxxrp-3JbGry1z9i4IVnt0A4k_1784471527
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'scsi-fixes' of git://git.kernel.org/pub/scm/=
linux/kernel/git/jejb/scsi

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2687659114

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2687659114_ppc64le_kernel


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

