Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7020405C2B
	for <llvm@lists.linux.dev>; Sat, 16 May 2026 11:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778929388; cv=none; b=INepcDkvdUZiFcbE91qk7TjkBe7kp39DsyOh4GPDSgZDBCFmUbnCLmzJeNmt4N2m0e4UI/nkEd66RwMXJ0fQbe3NkxXfUbAhvOgG8B0SmhOFWXaYYDajfvatC2kr8QiPA55M1OQ+XYfwRYnE7cUwe75Jwc67Viu8WHIzeZroXsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778929388; c=relaxed/simple;
	bh=AteJhzRLc1eqYVWX8cDeqoFs1V2QdUN7fo+YkSR/Bgg=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=GQ/R+W5aPT1fjzHXIsY7gCCT3yjpZBOeiHHTIIKKorrqulwjo/RK02Tk+jRxdqEouTxxOoBYoEmNRLl0Q1fsNMgjg7SXANF6MkBUT2mHc4Ldh5j1tBOvQRdmd1lVaEF6FNBqnGglJZJ7yd50TlSYEmvNM8IamE+YNstwMbPhZHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VAhNdj+D; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VAhNdj+D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778929385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/QgfQ7lEXxVTIcxoQkBOBHetZFvhwTQ5bnkAD0fq6aw=;
	b=VAhNdj+DE1uKjM2VgOh798YO9TCeokmGAdhB294QGJEvtW+6q5oSTNEzXwA+WSAczWcTg0
	F/Cn7tTNga6ADola4nFBP5cmkoGrwNXtQkqbqkHugkiddjw9dHFLvn2FsmBRNNqP+p2LM1
	M0Fcr+JX7erkF2psjKYm7IvfY/Uep00=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-608-9CeA21PqMNC8rhcmIYiofQ-1; Sat,
 16 May 2026 07:03:04 -0400
X-MC-Unique: 9CeA21PqMNC8rhcmIYiofQ-1
X-Mimecast-MFC-AGG-ID: 9CeA21PqMNC8rhcmIYiofQ_1778929383
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3AFD6195605E
	for <llvm@lists.linux.dev>; Sat, 16 May 2026 11:03:03 +0000 (UTC)
Received: from [172.20.187.136] (unknown [10.30.45.25])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BFF4F1956053;
	Sat, 16 May 2026 11:03:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.1.0-rc3,
 upstream-mainline, b0662be9)
Date: Sat, 16 May 2026 11:03:02 -0000
To: llvm@lists.linux.dev, yoyang@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <92548.126051607030400546@us-mta-608.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UPjH7iJgYd2AQNw0lcZWEvnvNanpMxC6KVOsW_QkBm4_1778929383
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'v7.1-rc4-smb3-client-fixes' of git://git.sam=
ba.org/sfrench/cifs-2.6

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2529312047

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2529312047_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2529312047_aarch64_kernel_kcidb_tool_21295613_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301

    We also see the following known issues which are not related to your ch=
anges:
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
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

