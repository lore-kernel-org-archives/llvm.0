Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3986531E823
	for <llvm@lists.linux.dev>; Mon,  6 Apr 2026 05:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775454189; cv=none; b=DK+eVM++wa4RBgPaQI1P5GRGS3gePfuBqiTpAGA2bTxW1OtM4Of0lRky1DVQRHNzxTl1kA845GysDkGXiZ+kh9Qn7vwD2PVe8ZyKhDT71yoM97Ep/GowLX/m7ilfe1mv31h8SXUd/FHoempCJtB/sTUTu7xt5j5Od/bdbcW+ruc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775454189; c=relaxed/simple;
	bh=wsBWf1mEDKYS29tBDorbHYrCPXUkn0LBLQWlarnWf+Y=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=fPo4c3g5vw5T2VZWTzLM2Jre2XD8FR5GaRIVue8v+D2zk+CwCOiPiYvxw9kvlNnb5bSIFohLJtbHGv/QmLqEYOJ/8/jZ930XcheqPJnARL3ZNZE54IWK6pLEDGO6rvy9XWXgQNDrW25h7XKgXcoA+xx16mA1pnEZiC+Hv/15MWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PRAN4bek; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PRAN4bek"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775454187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=w/r+7EhBG+5l2dO6Oefk0nERogsUeEL3zQ/vPwP9WVg=;
	b=PRAN4bekNZW1GSkPkqOZU8fAEZP/969m4utl/OBWmEKIxGzfukWDIJTdqRFn/xlKE6/y21
	BVEVQGQhfpTw44400zSZ4CReuemrs8RKMm0cHau+dX1UEzfGCQ3N5ENPJeRkbg8t4oeN2f
	g4wMa/X9P5XZ2F/9UTt8S+PfB23HPME=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-626-YRk6DCBcMMyFoRBPp8XRuQ-1; Mon,
 06 Apr 2026 01:43:05 -0400
X-MC-Unique: YRk6DCBcMMyFoRBPp8XRuQ-1
X-Mimecast-MFC-AGG-ID: YRk6DCBcMMyFoRBPp8XRuQ_1775454185
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E491F1800365
	for <llvm@lists.linux.dev>; Mon,  6 Apr 2026 05:43:04 +0000 (UTC)
Received: from [172.20.155.76] (unknown [10.30.44.186])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 884E618002A6;
	Mon,  6 Apr 2026 05:43:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.0.0-rc6,
 upstream-mainline, 1791c390)
Date: Mon, 06 Apr 2026 05:43:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <82862.126040601430500805@us-mta-626.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LyNZI-dlj7_7y3K0AB6NbA-N3SvtY5PbfAKMopHcuyU_1775454185
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'char-misc-7.0-rc7' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/gregkh/char-misc

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2430904927

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2430904927_ppc64le_kernel

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: fedora rawhide - nfsv4.2 failed to update ctime when calling=
 futimens
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2417851
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
        Issue: xfstests nfsv4.2 generic/309 FAIL on 6.19.0 as "mtime not up=
dated" and "ctime not updated"
            URL: https://lore.kernel.org/linux-nfs/20251219175955.4480-1-ok=
orniev@redhat.com/
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

