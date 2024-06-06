Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A765199382
	for <llvm@lists.linux.dev>; Thu,  6 Jun 2024 18:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717697530; cv=none; b=Fkf6aQs/fVg/K5rFXkenmke0DOB2rj9hX0Ss5xKwcXrRPWLwjIUFkkPpqvj3BmKokn6gNohbkR7G850cCT/EFPug9l1Ptmkay75kbL+2eFm8Q0YjAtTJUBe2jX0gcP3axh2WZWzxgYmYVQYMHx1VF9Isdf3+s7Jiwvbuo3EaBHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717697530; c=relaxed/simple;
	bh=oddttr6/dBOjrBsoraPZwnWbVY5LzW5Z33pBnCKx4po=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=DDv2HPgaLHT1YCAscZm4wNe2ERGwnlL4lRsDngcjSQTZS/TSVsJlRvj7Qj57K4BLVg6UZAarGVjZjYkf9b3v2z1lMVt5GH5BMSriNX2JiPQHwMsoCQ/sqSDCiYDtc8TIM396m6Vf2D7RLvMyy14M3vL+Blxp1z7SnpRXLtTdakM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BA9FamI9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BA9FamI9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717697527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XPFWdmt2yTr0/eRsU8YkRvtvUV/exsQg8jWB3nxhq6o=;
	b=BA9FamI982v9LUvKXH7RPi4drA15a/Gd6/N+Kshob/6+albZ7+RGRj30Yw8dZFn+I45fCw
	V+om4pChzMAnw4++6JKqoicYXjN64if7mT9+DxkseRGoc0gDfcxTIC406wjIf1lwTjXEuk
	KNZfxsWZ9XGh5U9U3dLSx/vJoM6N62E=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-590-zqFt15wYM-uclbpaE9Qh8A-1; Thu,
 06 Jun 2024 14:12:05 -0400
X-MC-Unique: zqFt15wYM-uclbpaE9Qh8A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8723F1C05122
	for <llvm@lists.linux.dev>; Thu,  6 Jun 2024 18:12:05 +0000 (UTC)
Received: from [172.64.4.49] (unknown [10.30.33.216])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 453BF37E2;
	Thu,  6 Jun 2024 18:12:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for master (6.10.0-rc2,
 mainline.kernel.org-clang, d30d0e49)
Date: Thu, 06 Jun 2024 18:12:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
Message-Id: <04335.124060614120500665@us-mta-590.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: PASSED
             Merge: OK
           Compile: OK

Tested-by: CKI Project <cki-project@redhat.com>

Kernel information:
    Commit message: Merge tag 'net-6.10-rc3' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/netdev/net

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1321518631

One or more kernel builds failed:
    We also see the following known issues which are not related to your ch=
anges:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1321518631-aarch64-kernel
                   Issue: [upstream] Build failure - No rule to make target=
 'certs/rhel.pem', needed by 'certs/x509_certificate_list'.
                          https://gitlab.com/cki-project/pipeline-definitio=
n/-/issues/241
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1321518631-ppc64le-kernel
                   Issue: [upstream] Build failure - No rule to make target=
 'certs/rhel.pem', needed by 'certs/x509_certificate_list'.
                          https://gitlab.com/cki-project/pipeline-definitio=
n/-/issues/241
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1321518631-s390x-kernel
                   Issue: [upstream] Build failure - No rule to make target=
 'certs/rhel.pem', needed by 'certs/x509_certificate_list'.
                          https://gitlab.com/cki-project/pipeline-definitio=
n/-/issues/241
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1321518631-x86_64-kernel
                   Issue: [upstream] Build failure - No rule to make target=
 'certs/rhel.pem', needed by 'certs/x509_certificate_list'.
                          https://gitlab.com/cki-project/pipeline-definitio=
n/-/issues/241
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1321518631-x86_64-kernel-debug
                   Issue: [upstream] Build failure - No rule to make target=
 'certs/rhel.pem', needed by 'certs/x509_certificate_list'.
                          https://gitlab.com/cki-project/pipeline-definitio=
n/-/issues/241


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

