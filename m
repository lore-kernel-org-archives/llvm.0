Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFEA3793DD
	for <llvm@lists.linux.dev>; Mon, 23 Mar 2026 09:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774258476; cv=none; b=ldbFB92PSPhmm5TYv9yBhlQjz7PChIpweZ+KWfZQ1xIEhDMvM8sfH/aTvs1h5RUhi9WvOCOAbcPVQeEISf33BAYQK3Dl61tIWyuca5JZiqYEPiEsat7mLTAd5qnKPk2m0qHExIYa0+gZl1zg0BP8rJdetE2nSQt5YqBxhtoRgHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774258476; c=relaxed/simple;
	bh=AtsToOKDluaEdX51nE3VJvvs+WVxnjZwuyLDleJ3UMs=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=hOoWN6lPJfDcA1JHe5AbhOBHI3MtjGRIttESDOsCDKwME4B3GOYhSgmGe8UaPieDPSWPzgkWgWvOUgWaYB5YsfC0WW2ZrmmpmgJf1KPgSiwlGUIRwIUGr/LnSgY8XRGRSCLbBIxRcy2Nq/FSBRe0jNFte4Sw1ip58eJPJEw6VUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RdDopsBK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RdDopsBK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774258474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zaSg6itYugGxnz+4ILPAfCnYY6OxXelCVXeHpQQL/y8=;
	b=RdDopsBKbDrPOsYrUiRN6nK+8EeM4CNwSSmzCS1U6xNMB8PedZEXfUEIMltFz3UZl/qmDK
	f3U8PDowIxJ0e/WM7dVfw8GFNaU1onKf62ZB02i4/bWoLqi9p88i5/WkNp0k9Jovgs4obd
	xJZN8QnwaPeFGOzWZA1c+M9g3Mg/oEs=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-106-RKl-09wVNBKazLEe7qzASQ-1; Mon,
 23 Mar 2026 05:34:32 -0400
X-MC-Unique: RKl-09wVNBKazLEe7qzASQ-1
X-Mimecast-MFC-AGG-ID: RKl-09wVNBKazLEe7qzASQ_1774258471
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DEDAD1A5815B
	for <llvm@lists.linux.dev>; Mon, 23 Mar 2026 09:23:07 +0000 (UTC)
Received: from [172.20.168.233] (unknown [10.30.45.63])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7EC30180058B;
	Mon, 23 Mar 2026 09:23:07 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.0.0-rc5,
 upstream-mainline, c3692998)
Date: Mon, 23 Mar 2026 09:23:07 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <03806.126032305343200143@us-mta-106.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: J-CnLvCrtXNrn8EcQUdxJoTcURkct8FuNroldPzLB-c_1774258471
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Linux 7.0-rc5

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2401438269

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2401438269_ppc64le_kernel

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
        Issue: avc: denied { getattr } for comm=3D"rpcbind" name=3D"/" dev=
=3D"pidfs" ino=3D1 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsys=
tem_u:object_r:pidfs_t:s0 tclass=3Dfilesystem permissive=3D0
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2417839
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
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

