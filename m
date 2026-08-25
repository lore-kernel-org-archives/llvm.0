Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6923430567F
	for <llvm@lists.linux.dev>; Tue, 25 Aug 2026 04:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787631732; cv=none; b=rlFSlZqhfAoV6kQ+7pNEskegbe2NeK6tWRbt/MoDlPRSwmq2r2OjsWFBW+tkd3bYxohlmnfHB4N1TwADHL3Uy+htHB75PpkJifYQsNohdHhupG3KMxmYlNZW/wBcJYvCTqsqSWcLQt0kG5WRBW8SHfJTMTE/z03GCzQalsYz34w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787631732; c=relaxed/simple;
	bh=vnJCAEB4Xr7msEGkhpaW709P6o9jF6Nh8V4FQv+a/y8=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=ej4OgMx6kPhl0dqjmPdz81/bAbjuAMli3qIQO4HUnEVSgdptnVsMxvBlFXin7c6j0fJ69eK/tZi5IFnyP+1+CIKl1BmPlq0srqksBTLnBM6ISnzXuS7TfBGElg52xhxQGr2+/OBbAlZ2h1K9Xo8P5s2xiw+ksafGIifAwxhsmYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hCxockeZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hCxockeZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787631729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EafavVxSOUCXG4dWwzoxfgDtADh+kSGeIVpM+yc9W2E=;
	b=hCxockeZcrOZ1TgMvdU+n+DD2chsrS1J1lqo0P34TA4b+GrdIKzeshk1YRrihbySrXMfhV
	AzQmvI/z8+tI4blDYIaTRiEa9LPL/4JqLlNhTeOuDZ/XT+V3Fe1HeV3fYnJKvJF7bEbSCc
	BFJPZPzDNX963YzhaL3ph63fuIGaspw=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-653-ktijoxL2Mxq080Y6BfDYNQ-1; Tue,
 25 Aug 2026 00:22:07 -0400
X-MC-Unique: ktijoxL2Mxq080Y6BfDYNQ-1
X-Mimecast-MFC-AGG-ID: ktijoxL2Mxq080Y6BfDYNQ_1787631726
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 81492195422F
	for <llvm@lists.linux.dev>; Tue, 25 Aug 2026 04:22:06 +0000 (UTC)
Received: from [172.20.61.140] (unknown [10.30.44.61])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C21F830002EC;
	Tue, 25 Aug 2026 04:22:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.2.0-0,
 upstream-mainline, 66498c75)
Date: Tue, 25 Aug 2026 04:22:05 -0000
To: llvm@lists.linux.dev, bgoncalv@redhat.com, ftjahjad@redhat.com,
 fs-test@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <91397.126082500220700821@us-mta-653.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _U3U_3D19HtIvKsRrvL4daqH0cRrKZolgdWns6gOhCg_1787631726
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'dmaengine-7.3-rc1' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/vkoul/dmaengine

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2786976864

One or more kernel tests failed:
    Unrecognized or new issues:
        Boot test
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2786976864_aarch64_kernel_kcidb_tool_1200073893_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL distribution/kpkginstall/journalctl-c=
heck
        Reboot test
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2786976864_aarch64_kernel_kcidb_tool_1200073893_11
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check
        xfstests - btrfs
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2786976864_x86_64_kernel_kcidb_tool_1200072412_9
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

