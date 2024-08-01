Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F124D1422D0
	for <llvm@lists.linux.dev>; Thu,  1 Aug 2024 19:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722541390; cv=none; b=t/YiCKWs9SnFidaHz1PqYVl+JmkSBOzqFOSTnTSOO0f9h+/l2tM7W3ts1BCcVHGOuz8g71DRO/CgEQHB/ExXl5suGPu9zd/PbDiTrnKzcVrgxvEnwqtVMv1g3PIlvcpjBgZcVzJbcNuF4/P2NtPOiEJsbPAmn5R5ozE0sIbX+U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722541390; c=relaxed/simple;
	bh=tI+s3dNPqF92kLDh47W3sRmvaCA+alajLbGqYMylF+0=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=UUle4zaP5iPJRCfvP6+SXIykpF0lXEw2lwBhiPMRkBPG+5YtpuRQHzubbmV3wFvln5QisMQ3QRnJhgpT0v+rMFNxerwiwAmIsmrf1Q4vvNKcPhmXGBjbjNjLos0DwDyByvs6X00jQdvlYMCNDuV6GXWzLWb33S1vXZx/geI2F1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=fail smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=daNHOHEn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="daNHOHEn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722541385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QJ+xZ3yDhOqfXBmJh/B3M7EvrDmB8MhVeYMEIRV1CG4=;
	b=daNHOHEnUiDa59sqAsf9+onzPMNgP2RmfIYQcsXu/QVxMggYae85dSa94jmzXQ3NyIXFen
	JVWM4I1YxpymVXOk/M/d11U0qPDHb/qWAScNYzSOJUwOEyrwMFSs5zgiKxWS7S5v2RQwkf
	psN9ZK54jsidglGqUf3YH+vKpP/WHAY=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-592-rDyzrWjJMjCmcoKH-nLY_Q-1; Thu,
 01 Aug 2024 15:43:04 -0400
X-MC-Unique: rDyzrWjJMjCmcoKH-nLY_Q-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CCBDC1955D56
	for <llvm@lists.linux.dev>; Thu,  1 Aug 2024 19:43:03 +0000 (UTC)
Received: from [172.64.4.38] (unknown [10.30.33.216])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 232D119560B2;
	Thu,  1 Aug 2024 19:43:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0-rc1,
 mainline.kernel.org-clang, c0ecd638)
Date: Thu, 01 Aug 2024 19:43:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <15007.124080115430401100@us-mta-592.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'pci-v6.11-fixes-1' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/pci/pci

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1397547958

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1397547958-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1397547958-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1397547958-x86_64-kernel-debug


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

