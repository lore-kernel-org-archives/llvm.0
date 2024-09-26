Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B6767A0D
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727360067; cv=none; b=Ilv0sJkglZpwsmnuNOK/qm4zp26zPssr/guvXaA9eHN5JPX/F5fzQm9Wfhf1rYjqvF/nI0yh3A571CigiyanU8CxekG2kwKQzQLpicEQteSTGjtgDMlMxNE8QHN/ttTVgVKPG8vd8y7n0czW+VgC1Cd1ovlVBDaErYVeA5R52HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727360067; c=relaxed/simple;
	bh=OcMOUDUfGuJOtngrKOUiCalqXFqtyyC7JmvhIkzD714=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=J5fOaPZEm2+tgfKlp0FxK3DcK6B6uUaMXkMlv3i0/pyZYskTk8eJZOWwYShDKWa8RA61k/uVq3XHfl6UhX4WEH25slWtXJTVJn0RUHRU4+Knx8vdo0N5t5RAmoCDud1vTQY1nPWQuTPK2o2X3T2o30HQp7LCnc0RfqBGIOTBoy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KaA6IZiC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KaA6IZiC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727360065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pUkt7GEyj6SoAF7NWPtGzgTyqvwPxnNFzXpZGVvMWc0=;
	b=KaA6IZiCicLkqRb1p1Zy8GAyFfG5wSqjjR5Vy7zDLQ0YPezL4wBAZhUePUKEkbC/iCDZZi
	Q6De1bUqSaRdEN9GUHVuR3EFoxuYgCh8njASibn3em04ZZ25UEQwGO77IHz/tcHySyefDA
	/3WjS/bOAbLwbp4kZdrwM2iTrTtRPFg=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-616-gSymr33qNXu8ZjQ3zTaX2Q-1; Thu,
 26 Sep 2024 10:14:24 -0400
X-MC-Unique: gSymr33qNXu8ZjQ3zTaX2Q-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 58016197904C
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:14:23 +0000 (UTC)
Received: from [172.64.15.17] (unknown [10.30.34.46])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 038461944B21;
	Thu, 26 Sep 2024 14:14:22 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0,
 mainline.kernel.org-clang, a1d1eb2f)
Date: Thu, 26 Sep 2024 14:14:22 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <11526.124092610142400817@us-mta-616.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'scsi-misc' of git://git.kernel.org/pub/scm/l=
inux/kernel/git/jejb/scsi

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1460233210

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1460233210-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1460233210-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1460233210-x86_64-kernel-debug


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

