Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1EF1E5201
	for <llvm@lists.linux.dev>; Mon, 27 Jul 2026 09:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785144190; cv=none; b=Lho5wXHSXZsm9SYL6ivQy28FW1qAF/RX4ikKNkd1NjCXEXe0cp1DZ2+Pd/zdO1Tr23K2HY2GoL85EUUqIzR3imqjvdyjGebCb5d/seZNAULo/SBuYIL7lbm43VCh3ADodtkNf+jZml/BsZkZH/pq6JqmsMpr40q0JAyW9HgtkEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785144190; c=relaxed/simple;
	bh=gFmaiHbFVxeaOG1Oeo6KkabFk7ZqVvX4rULyocTsoDg=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=tflDToj8DVkW74u0hyDfkYQHkn+a14h/AH90pBk8o9V+oXSCellMcX53G51/vknMeVoBKFWX5IseTs+RvUwBXQG65sxtZ2YSta4846ZghM8SA0NWUrHfg5uSHbdXZLNWZrSYSpdyBM1vI2uaNyi/FpEQ9nP5M4iyb+vE8sezZo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fs02RSzb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fs02RSzb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785144187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=G+GIoqN+1sVwj3qOKrhwO/cFiMvj7+y8gD7TM5yck24=;
	b=fs02RSzbxokm7pIEcHdJIfp5QuLhhvzQ8m5wYDyRGpUrCOVv/o1F+MI/nqd4HhcgS3dYTC
	3sC8AyPwlYqQ6bV4klIFlih6f2d7/HNZCaivB+NsO2n6G+NtOG3KH+DCmDZqNe+UPxoLTi
	fsCqT0uiuUBHBRvJdaQibqG0w1ONh2Q=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-142-U-lSysWePoquT2ijKYNM9A-1; Mon,
 27 Jul 2026 05:23:06 -0400
X-MC-Unique: U-lSysWePoquT2ijKYNM9A-1
X-Mimecast-MFC-AGG-ID: U-lSysWePoquT2ijKYNM9A_1785144185
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 237E31955E8E
	for <llvm@lists.linux.dev>; Mon, 27 Jul 2026 09:23:05 +0000 (UTC)
Received: from [172.20.176.224] (unknown [10.30.44.218])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 70AC130010CA;
	Mon, 27 Jul 2026 09:23:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 2 of 88): Test report for master
 (7.2.0-rc5, upstream-mainline, f5098b6b)
Date: Mon, 27 Jul 2026 09:23:04 -0000
To: fs-test@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <55493.126072705230600373@us-mta-142.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dWx1fGpwEwdtqHtK8VR9CqckYHpDqQtoZjV2Pn5KHeQ_1785144185
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Linux 7.2-rc5

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2707047217

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2707047217_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2707047217_x86_64_kernel_kcidb_tool_21732038_9
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


Tests that were not ran because of internal issues:
    /distribution/command [s390x]
    Reboot test [s390x]


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

