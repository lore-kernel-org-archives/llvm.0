Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B2736C5A1
	for <llvm@lists.linux.dev>; Tue, 16 Jun 2026 14:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781619789; cv=none; b=sgVBs6BjEJWFB653QWvhIgcUsONeU2DRBws5ei/4qhOsa7IQ+GYZHdDn2hMIAypHwPl9KXp7vkw71DY6H/0oBQEBSsYCaEtbaBmQwIKq6NyqfvzmoC2nixGCt6hcSqsfz/BQWQbn2hxV7seKzgPb58GKme5DICY7Tx0bsnXOaIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781619789; c=relaxed/simple;
	bh=3yu1XruQfsSqB2rQlvBpjyeAIZ/BQFRuDGHcEysY7fs=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=a6GGRxMp+BhdOHOwKNNslbOIlwnbiVb5FjWASQp2zT6Iq58XKuYOgbPCHc1DMWBIhUUYUPx9vPHicgK7XarJ0y9cRL+2uPlgpHcXq0b5VCXW408J76775+7tYYvlGdUPJTnQ9NxvoNfd9/4xhkb+IzLT5orMIw6J3tB+mCBjLDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UPvwHv48; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UPvwHv48"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781619787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2MuufBwHep+BZYKwM73y1aYRsDnJb6RJeqWuD57tOTg=;
	b=UPvwHv48o/7qtWKJ6ZB5cF1/0YKo5zN1qISm5/wByADusv+LJTcj052KTkDT30phBbWxYs
	X89ejhsUGFHnni/xVP0NTJVnMD7Ku2HTivQ5G4Hm86KmkS9TxLIyaCIt+A/anc+q9BMl5f
	NRWFm3aY706vmrY8DCnplLSpEVJhQ3E=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-153-OxXPqEINPk27ZL3KewCp1A-1; Tue,
 16 Jun 2026 10:23:06 -0400
X-MC-Unique: OxXPqEINPk27ZL3KewCp1A-1
X-Mimecast-MFC-AGG-ID: OxXPqEINPk27ZL3KewCp1A_1781619785
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 13F321955EA3
	for <llvm@lists.linux.dev>; Tue, 16 Jun 2026 14:23:05 +0000 (UTC)
Received: from [172.20.180.65] (unknown [10.30.44.105])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 938FB1774;
	Tue, 16 Jun 2026 14:23:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.1.0-0,
 upstream-mainline, b0820861)
Date: Tue, 16 Jun 2026 14:23:04 -0000
To: llvm@lists.linux.dev, yoyang@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
Message-Id: <42121.126061610230600177@us-mta-153.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: j3lgXwk8ReIw3b4smWeXCp1dPwb305tCkuQfn2rcH6o_1781619785
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'x86_tdx_for_7.2-rc1' of gitolite.kernel.org:=
pub/scm/linux/kernel/git/tip/tip

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2603725464

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2603725464_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2603725464_x86_64_kernel_kcidb_tool_21470749_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301

    We also see the following known issues which are not related to your ch=
anges:
        Issue: avc: denied { create } for comm=3D"rpc.mountd"
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2456368
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
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

