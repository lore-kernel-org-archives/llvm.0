Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11C5567D
	for <llvm@lists.linux.dev>; Sat, 15 Feb 2025 05:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739596333; cv=none; b=SkHFFZBSSbGmexS1xkeATKdk+fYAoRvc5dusYK6YWF/uQqI3jLWlZn63dt86dILjUEjQRKXz6E8u4Qt72K1qqxffsWvl2VLUAcyRKo+sNgTEzgMdObBoEttlBBUUuNxkTZN0Ssmwib85171mS4a0VOCXrdXqutos+mrggqmkvao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739596333; c=relaxed/simple;
	bh=hVf4r8Ja+7R2E7fxLpBCaJBh096ahSlLyJXWrZzq2Xs=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=gx/OeQvwP2WiAAl//kg7WhJenZu6J7TwIim4VdTr5NBHrx7601mCZbMpvOCJLUSzjtVzefBe3TS2IZzJ5RrpNc7228y3O85Z3gklSDocDrk5ldg4TwTAFXLTVstxMvAGI4j0qA4gOuR9QRLloXJ5j6nOcc/09mnqMPsgt4fimt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I3IYwi+j; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I3IYwi+j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739596328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8FgkhX9aXBWD8xM94R4+AmcjwpTF2BIwrZLUvH+1yKE=;
	b=I3IYwi+jXkcRncXxFoyihONopaqq3Y9sry1jHr2KoJN2I/M6YLuAVFC8ueq+Gl9+g2GJYg
	Obb1IO4YE3nTnhRr43RUoCML+UpQXExlmTK/rbecQ6aGdOtSUpzzIuJP9H3eWxpi5EZSQX
	vT2rImMWiYU0qWqAR2Wz5kuWDyXoXds=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-186-lFq2LQmKNsWMi0bW07i6bA-1; Sat,
 15 Feb 2025 00:12:07 -0500
X-MC-Unique: lFq2LQmKNsWMi0bW07i6bA-1
X-Mimecast-MFC-AGG-ID: lFq2LQmKNsWMi0bW07i6bA_1739596326
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 328F41800871
	for <llvm@lists.linux.dev>; Sat, 15 Feb 2025 05:12:06 +0000 (UTC)
Received: from [172.64.13.25] (unknown [10.30.32.164])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B42ED1800365;
	Sat, 15 Feb 2025 05:12:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0-rc2,
 upstream-mainline, 7ff71e6d)
Date: Sat, 15 Feb 2025 05:12:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <79320.125021500120700369@us-mta-186.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: J1tDePJe7IkdrD53gKfp35kL8eeygAYMcjMeefTetHc_1739596326
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'alpha-fixes-v6.14-rc2' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/mattst88/alpha

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1672416107

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1672416107-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1672416107-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1672416107-x86_64-kernel
                   Issue: Kernel build: arch/x86/tools/insn_decoder_test: e=
rror: malformed line
                          https://github.com/Rust-for-Linux/linux/issues/11=
34


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

