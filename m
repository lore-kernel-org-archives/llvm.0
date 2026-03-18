Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1372D3D5667
	for <llvm@lists.linux.dev>; Wed, 18 Mar 2026 12:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773835931; cv=none; b=GqK3/Esy2Gzg0p2ik5fCnMBZwpzgxxECJbRlQcEoPqoGOI8S8sP7fCZiWrbJUfjqi9TW66+xdif6pDvIWUI58rk3ClFrJ47w0HnqAzZnAvQzCeOv0zEDtX1m7cUofbvXk6ZbCtoANX0vPLOTtRLhXcjEwmxiCfBgQi+2q24IGTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773835931; c=relaxed/simple;
	bh=OdXaUTJFfM57LzeJqKWfFggbN0Sk1stv43zewnaCmFM=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=V46iLUyGADmHQTnxsK2hrvK2WMYQavFX3H0Xe+rspA3zSsUWAX5dv+0hvSVAcuQxWWGqxLDZO0/ogvl9IYdKW7REN8RNYlRE1rzYdiQh5VU9qCNSOLkb37ICmx85GYCds1Lcq3VCbm6fenIuU6+K+SW6TU/sE6MHDhVcoIGt1hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EwcL9M/j; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EwcL9M/j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773835928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CBoQboDFLwbVOirh1YYtja0BrJTinkHtPrna+fq5HqE=;
	b=EwcL9M/j4SQRTY0tTiO2NGvVn6X8JRcEYqArozYuKXY8oemLUT/19R/CP0lMUhH9DOfKE7
	4i3vA0Zyxke0nxwAuUquGjy7ejw/q+cQVGPwXtU+jFwLfwcKs0oG3WmEEOdkgCN/MP1MJA
	GBcKdf2xl/4R1/C5mOvUbj6HQotJziQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-632-JaoFr-zlObmdqeBg5mZoCg-1; Wed,
 18 Mar 2026 08:12:05 -0400
X-MC-Unique: JaoFr-zlObmdqeBg5mZoCg-1
X-Mimecast-MFC-AGG-ID: JaoFr-zlObmdqeBg5mZoCg_1773835924
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AA9D619560BE
	for <llvm@lists.linux.dev>; Wed, 18 Mar 2026 12:12:04 +0000 (UTC)
Received: from [172.20.92.244] (unknown [10.30.44.31])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4AA1F1953944;
	Wed, 18 Mar 2026 12:12:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.0.0-rc4,
 upstream-mainline, a989fde7)
Date: Wed, 18 Mar 2026 12:12:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <52671.126031808120502255@us-mta-632.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hFFscAHbStRLhKXhiHicvt47azJxlKcaXdJKDJnn_Sk_1773835924
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'libnvdimm-fixes-7.0-rc5' of git://git.kernel=
.org/pub/scm/linux/kernel/git/nvdimm/nvdimm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2391855067

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2391855067_ppc64le_kernel

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
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

