Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF4B1A9B24
	for <llvm@lists.linux.dev>; Fri, 14 Aug 2026 03:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786676531; cv=none; b=f/3INUWHmejuCGhHsOqq2nCuAmizSxTUmUWEnV6+CvqewncXYfzSaf16p3L4omVHTXBznkgBiuLRigRQBCB3kraxMCGVCFX2HU4OySorKNYZ6wnHXQXQp8GEZzcgu/hFfFhsjF0sU9JdlHMi0iJ6IkmqFQmYA7WBUYiPxyuxr2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786676531; c=relaxed/simple;
	bh=lZwju8L8HCzB/yipDg3+TzKahFs32O64k7GBxntp7Eo=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=CIH8rmF7EDVWXsuoroA1+pvVHf4s/AdSR+mT7DxDEMfqiAS4ozN+Frxdi4W3kxY5D57OYWqzOFrXFBVmqs+/ZQraLOvOnzUa/d2qJNXkFBqMClaDnq4knwcpIzuqr8T5uzDqOS0bvQwEGO1fo2HSHMtSmIdosDR27lo5WbOrtcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T/I/YChb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T/I/YChb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786676529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2d+6ue7e1L9knHbJcLiDhwL0ESBiUaQhJB5yXRiqDvs=;
	b=T/I/YChbi3mAckXy8VRcHcyqC5j0XG2SSizZcXvwOm+7O7ES07oGuXK26/IxHfmUBA0LKt
	cg7ccUbguFXyFsKfa/1ifHhodXe25jrhX3klbMJPoZrg8kd3qRp2v+8FFKmZAkg1K/CTl4
	pmp/22+YBNOItaNcqb2T2ALqjVSzSEI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-530-xiN4MjxWPO6uY0qbNdX88w-1; Thu,
 13 Aug 2026 23:02:07 -0400
X-MC-Unique: xiN4MjxWPO6uY0qbNdX88w-1
X-Mimecast-MFC-AGG-ID: xiN4MjxWPO6uY0qbNdX88w_1786676526
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7E0D118001E3
	for <llvm@lists.linux.dev>; Fri, 14 Aug 2026 03:02:06 +0000 (UTC)
Received: from [172.20.35.218] (unknown [10.30.44.80])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D99A0423;
	Fri, 14 Aug 2026 03:02:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.2.0-rc7,
 upstream-mainline, 3aa1dcaa)
Date: Fri, 14 Aug 2026 03:02:05 -0000
To: llvm@lists.linux.dev, fs-test@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
Message-Id: <82627.126081323020700237@us-mta-530.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Qh-kpBXKvtbrY_xhQizfCNH1abrOzJT63cu8BW2KnDE_1786676526
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Revert "wifi: mt76: Disable napi when removing device"

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2758318277

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2758318277_x86_64_kernel_kcidb_tool_21869770_9
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

