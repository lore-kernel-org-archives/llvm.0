Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CC79282F16
	for <llvm@lists.linux.dev>; Sun, 29 Mar 2026 05:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774762989; cv=none; b=K9+Gg1UnI8twvf7DcifVcGjwlxaAskNfnminb8O9znbPbLd2LuR7so5TKDdAE4lBYIYtuLTJd2BD4091pdgnJHn8aKMLtgA4YT8zbeu/aKT1u8c/RDg9ACRTKNkKuOtu44ZzfrjlwlVPdf4lCo1slIQO4PRmBG4ImsqTGn77PS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774762989; c=relaxed/simple;
	bh=CDPhr6bD+9XCt8CT2wO+8BE2mSXylllogQGtQlBHF5E=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Qvlr78XugeTy/h0bZBjsnk7/mGKtTq2GQQnFF6T//TKFaD5MmmkqO7jkXQwv/JJzaPnDn0AfmSJSRT0IVQ3xeEZH8F97dahfSgG0OR576BBNJAP6jC0iNasPb7FHem1TdKTGmdbusfXIxwXs3A9kn6VrpyNN4j0+3Mq28HO6ANs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UvAeav0o; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UvAeav0o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774762986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KccbMQR/6JVWVFpCc4O3P/WZ4UCWAclJKOkutvSgBdY=;
	b=UvAeav0oP4s4Q7oW4mk50qRG89zUsyp8wA1VtSkAdY9b5QMi2bn7AzmR6qJDlvQ30R/gZb
	qInEahGFedVDwdIvM/gMeeqFPuA+lxwcU+5LdO+P9edhE/GjtRhlkioyVNE4iRFQT9P0Vc
	WLd+CWlnsgV91XrD7Z2HsRHc//LehTo=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-396-tLBfH9TPP_evPfqNKMcFYw-1; Sun,
 29 Mar 2026 01:43:04 -0400
X-MC-Unique: tLBfH9TPP_evPfqNKMcFYw-1
X-Mimecast-MFC-AGG-ID: tLBfH9TPP_evPfqNKMcFYw_1774762984
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1027C1800365
	for <llvm@lists.linux.dev>; Sun, 29 Mar 2026 05:43:04 +0000 (UTC)
Received: from [172.20.201.103] (unknown [10.30.44.137])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B2C501955D84;
	Sun, 29 Mar 2026 05:43:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.0.0-rc5,
 upstream-mainline, cbfffcca)
Date: Sun, 29 Mar 2026 05:43:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <28347.126032901430400120@us-mta-396.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1x2XmGh5kgNXs0YdkzoW-TAnHlYg6DolNqTSJE0GXPA_1774762984
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'trace-v7.0-rc5' of git://git.kernel.org/pub/=
scm/linux/kernel/git/trace/linux-trace

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2415527445

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2415527445_ppc64le_kernel

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
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

