Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C891B175A7F
	for <llvm@lists.linux.dev>; Sat, 28 Feb 2026 22:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772317332; cv=none; b=YnIBqoSOv8cOSl40msYJQGpNXCMujErjgdKgrq1K7mk+Ie0uzKulXtQFlXm/D9m8q1rCCaQRMml5aejrjZimAUs3pzCW3Zq1pJJ440Ph5XG/Pcmk5Iw1/3P/xIV8qU/YlCPeviIV1vE3Wwkn4aY3kvhs2CIbwI/TMY9pB25BBVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772317332; c=relaxed/simple;
	bh=bzlVO4RwbdguuQBRGJG+qfhJqLGu0dekUozBwKFK1V4=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=mr7lZ/8H9QTB7bXkzhwOuegiFMk+ke6+27bzjowc7KaOCm/HgIi6as6w2rVeaJxuASRXvimjDO9ZF4PV5s5aFPV/VQAvo81wq/IVgx+CoqZo+1u654Iogyhv/ioGWxZ2zV8tyCWFPsQzeMsOesESVPYRVe2Zauc1DCOl4l9CncI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BBn4liHO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BBn4liHO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772317329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CaAwJLh6Gldj+waOXNAP7qvt4KpkZq0N1bxA7yUSdcg=;
	b=BBn4liHOp6i17OAs4cbkopkqyt0ZjUXu+sYBE2SW+0lhVERJbU8bpC9pNGby8IDMYyWqTn
	aBjrfH1g6HhsiEAc82n39SVO/ogcFu8ji91sHvhUn5pK3PAqHx9AkQruALg8P+qx+wVrN0
	BgrxxbZaw0A97lknCcRPNuOMa/JNj/M=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-599-SvrT6DqXO3mLWecDM7qBaw-1; Sat,
 28 Feb 2026 17:22:08 -0500
X-MC-Unique: SvrT6DqXO3mLWecDM7qBaw-1
X-Mimecast-MFC-AGG-ID: SvrT6DqXO3mLWecDM7qBaw_1772317327
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 563051956059
	for <llvm@lists.linux.dev>; Sat, 28 Feb 2026 22:22:07 +0000 (UTC)
Received: from [172.20.201.171] (unknown [10.30.44.137])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 88D791955D85;
	Sat, 28 Feb 2026 22:22:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.0.0-rc1,
 upstream-mainline, 9197e594)
Date: Sat, 28 Feb 2026 22:22:06 -0000
To: bgoncalv@redhat.com, ftjahjad@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <56325.126022817220800108@us-mta-599.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CWSB-J0pDgIWa-auJ9wE_ozi-IDM_dROaIYQ6pcqINM_1772317327
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: firewire: ohci: initialize page array to use alloc_page=
s_bulk() correctly

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2356020215

One or more kernel tests failed:
    Unrecognized or new issues:
        Boot test
               s390x
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2356020215_s390x_kernel_kcidb_tool_20771328_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
               s390x
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2356020215_s390x_kernel_kcidb_tool_20771329_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
             ppc64le
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2356020215_ppc64le_kernel_kcidb_tool_20771324_7
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2356020215_aarch64_kernel_kcidb_tool_20771325_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2356020215_aarch64_kernel_kcidb_tool_20771326_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2356020215_x86_64_kernel_kcidb_tool_20771322_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
        Reboot test
               s390x
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2356020215_s390x_kernel_kcidb_tool_20771328_11
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
               s390x
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2356020215_s390x_kernel_kcidb_tool_20771329_8
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2356020215_aarch64_kernel_kcidb_tool_20771325_11
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2356020215_aarch64_kernel_kcidb_tool_20771326_8
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2356020215_aarch64_kernel_kcidb_tool_20771327_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2356020215_x86_64_kernel_kcidb_tool_20771321_11
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2356020215_x86_64_kernel_kcidb_tool_20771322_8
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2356020215_x86_64_kernel_kcidb_tool_20771323_12
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check

    We also see the following known issues which are not related to your ch=
anges:
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://issues.redhat.com/browse/RHELTEST-39
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]
        Issue: [upstream] WARNING: drivers/gpu/drm/drm_atomic_helper.c:1920=
 at drm_atomic_helper_wait_for_vblanks.part.0+0x228/0x240, CPU#1: kworker/1=
:1/54 - RIP: 0010:drm_atomic_helper_wait_for_vblanks
            URL: https://lore.kernel.org/dri-devel/69381d6c.050a0220.4004e.=
0017.GAE@google.com/
            Affected tests:
                Boot test [x86_64]
        Issue: avc: denied { getattr } for comm=3D"rpcbind" name=3D"/" dev=
=3D"pidfs" ino=3D1 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsys=
tem_u:object_r:pidfs_t:s0 tclass=3Dfilesystem permissive=3D0
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2417839
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
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

