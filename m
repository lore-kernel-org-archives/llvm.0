Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E2F3806C5
	for <llvm@lists.linux.dev>; Tue, 16 Jun 2026 21:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781644991; cv=none; b=j6gg1D0K+MnGccEGs/BcQhDymEOP2DwcGHGEaZxCKxAIS+w8zW2n1YJqw/r7V/zECScjbAbErmK4Cy0nuS6AsBcr+FOD7Ux0j/KjChxniNcbRkDZZ6PifjlLdmcBc67nO8iIECEo7SK8kkmxJzH9gr9h0+/YPxCPK5tqCAHyt2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781644991; c=relaxed/simple;
	bh=OX4tTT5dZop91XY4FaofevEbGQJKT44u+/Auc++hRHA=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=KOav7nKyfKoCkFBXTkbSkv0dTaNUOHox1kdNOtkVxxO7WiUySyGAO/y+ry1V1Nyog/twP6088t1UeaYLfpCVtWbVSdd/lkpU2UCEx7270d1D0rB+J1tCvijn0jAri6bQ5zYz49TMoX26QBKlhVpx5p7QnvYezkZIq4dl0Aynats=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J5pGDbjc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J5pGDbjc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781644989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fSDOCErsemRH7DDf0kD4Ws6eOoF3I3q1r8vUQ07qh+k=;
	b=J5pGDbjc+0iJrySvVkVmlQuSyc7IZIjt7APTYHKRazl9iW9TjLFmlnOt6uqWuyAodAABum
	XynyD113ZpvPmafA310xtQKUR4JiWMqZ+NQQY/tCx9LQXaIJqJ0e8+Ya8045CAocHLdldU
	wsgseHruzkx0WFGeizYfgp0R0BdePEI=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-427-CSUBkU45PfKHmAc657hdxQ-1; Tue,
 16 Jun 2026 17:23:08 -0400
X-MC-Unique: CSUBkU45PfKHmAc657hdxQ-1
X-Mimecast-MFC-AGG-ID: CSUBkU45PfKHmAc657hdxQ_1781644987
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 13F1D19560BD
	for <llvm@lists.linux.dev>; Tue, 16 Jun 2026 21:23:07 +0000 (UTC)
Received: from [172.20.180.65] (unknown [10.30.44.105])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 85CB81955BC0;
	Tue, 16 Jun 2026 21:23:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.1.0-0,
 upstream-mainline, b1cbabe8)
Date: Tue, 16 Jun 2026 21:23:06 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <42421.126061617230800273@us-mta-427.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: V6t5Yh7_UrauKokR6h1ZvS2i7m9kpwG8Mp4Ot-HMgbQ_1781644987
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'for-7.2/dm-changes' of git://git.kernel.org/=
pub/scm/linux/kernel/git/device-mapper/linux-dm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2604535298

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2604535298_ppc64le_kernel

One or more kernel tests failed:
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

