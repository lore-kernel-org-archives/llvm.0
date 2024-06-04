Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9ADA801
	for <llvm@lists.linux.dev>; Tue,  4 Jun 2024 19:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717528987; cv=none; b=cMWopb4QxeQk9YunN2ZB4HM4eeFje2duBBHAYrD/Zam6MGDzXLxw7pFc1v29+fkMFd0Qj18xFkhQz4c0MjMCqGnKKmLsfxv2uZK6eyAJwri2N29RqlW/hLrgPu3u+P3FOJGrZ47R3qaUfagme+Ba8TY0PUpRRUstDRmW3rYqCTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717528987; c=relaxed/simple;
	bh=+xpPrGPcGDoysNgy37S/+V2UJBn4ZT6PscFairkRl+g=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=mdQuuir5B0ul+v+O15xnI5YWk8a1GtprajYGy/8fvWuLsrwatqOvIEWkAhozS6hMSc+iYb5+dm3NZYZKy2aWGqewQzNd2amTHuSeHRYlEHyF7KxevAa4z/GWK8JsrCqQy2w2PU4j3KwdIZvb9XAtey4L420+7MLfEoOm9ONoMq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VBwPJi4z; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VBwPJi4z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717528984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=See0YYsZlecg+fuCkxZ5S9EG/Dz52VHXUipRKvCZUXk=;
	b=VBwPJi4zOx6X8fNvZEfPJNaThmy+5tqSBkAEwgFQjoIBcBft0NlBSinX79lFaI9e+2wjI/
	J1hRfOP2JSx/OVF+ia3oESaznWP4zIqsFt46tI20INfyjAxEsw9iB7VGmPf1ZPVi/XSSvs
	FGhsk6jymgXnCBQV3zDtl/qoooI64XY=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-400-NTBSAudQO-qQ9_T3NJOMOg-1; Tue,
 04 Jun 2024 15:23:03 -0400
X-MC-Unique: NTBSAudQO-qQ9_T3NJOMOg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D244B1C0512B
	for <llvm@lists.linux.dev>; Tue,  4 Jun 2024 19:23:02 +0000 (UTC)
Received: from [172.64.4.49] (unknown [10.30.33.216])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8B0D2200A21D;
	Tue,  4 Jun 2024 19:23:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.10.0-rc2,
 mainline.kernel.org-clang, 32f88d65)
Date: Tue, 04 Jun 2024 19:23:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
Message-Id: <80160.124060415230301040@us-mta-400.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'linux_kselftest-fixes-6.10-rc3' of git://git=
.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1318349045

One or more kernel builds failed:
    Unrecognized or new issues:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1318349045-aarch64-kernel
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1318349045-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1318349045-s390x-kernel
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1318349045-x86_64-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1318349045-x86_64-kernel-debug


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

