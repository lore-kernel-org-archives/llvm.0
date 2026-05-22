Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFC83C585E
	for <llvm@lists.linux.dev>; Fri, 22 May 2026 10:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779444732; cv=none; b=S3ZghjzNc9rlXhx5xgpzDPMa/YRt6/FCMidoVr2MU6xZiJ19eFcJx6vNTRUGLT30GsVb0aK6Nxd30D/XvduQfmXdQ6V6tha1yWFG3fcXE5A1aSU2+C10WMyjzyRS7ORTDd0mPkISNCAjHaWehhMxYq1dT7ldiZCJDRCQNJ3i0C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779444732; c=relaxed/simple;
	bh=z6JOl1rRlmXhCdTKqNxlv0HWwnJK1XqbWQwVv0CHlZE=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=c3Xr4QQ8ssFS+iD13h+8ojQJkIxA2NCqRnxyJhXuruTiQ2OqbjEQYU9rs1Wtk7OZrhQUJNHTCtdLwOb5/a8iQQ16+y5O0olvT7SYz+mLuYWSnC8EkO56Oo9VYI00TrpbyzeW1mh/q4qQXQXfcgTGNYxPAc29Ia0+TNZ6exjwkNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IZEoWquI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IZEoWquI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779444729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EmcYsNphY9SGxYns1eprfSXbKWg/vbAvAbObNiz3Qqo=;
	b=IZEoWquIasj8gwmxbNpvjYyd4Qx0DdL20PTDi3OxkDpfyapJE6obm5QvKo2jghWNAlbLAl
	ZlHn4vbF0LqF8CSAg4FNNJkejzTmdtiPUx4Wr2q8En1Ok9Y4FUhOrg4Ih3zE7+Ao6OVObx
	K/rbqVEpF3Q65mbercBtvLNuyjQg2ls=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-88-oJH5lzs_PTygqO5zs4m9Pw-1; Fri,
 22 May 2026 06:12:08 -0400
X-MC-Unique: oJH5lzs_PTygqO5zs4m9Pw-1
X-Mimecast-MFC-AGG-ID: oJH5lzs_PTygqO5zs4m9Pw_1779444727
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6E3E718005B4
	for <llvm@lists.linux.dev>; Fri, 22 May 2026 10:12:07 +0000 (UTC)
Received: from [172.20.212.222] (unknown [10.30.45.124])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D4FCA1956053;
	Fri, 22 May 2026 10:12:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.1.0-rc4,
 upstream-mainline, 6779b50f)
Date: Fri, 22 May 2026 10:12:06 -0000
To: yoyang@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <69926.126052206120801323@us-mta-88.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pTq5aiFCI77chux0XnO3FXFrbVFwBBPr-pBseV6sXD0_1779444727
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'pci-v7.1-fixes-2' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/pci/pci

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2544880881

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2544880881_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2544880881_aarch64_kernel_kcidb_tool_21332815_9
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

