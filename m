Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A3637BE80
	for <llvm@lists.linux.dev>; Wed,  4 Mar 2026 21:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772658619; cv=pass; b=Siq8f7ZO/cdgtUmRTrc/8O0TvFA1khe4W78hNiEZk+GzZzvXJ+jP9VVq+Iph6HzPUnfx+Guu8ggIy4WlIIVQCaiu3Rje8OnIgcE98fKYuszHpD90RHEeuhX00muOKhK1ehxyuNcPpMMrnWbr3iegMWpv0lazoG7Grqvc0ktPvvo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772658619; c=relaxed/simple;
	bh=1x0qGC1z7KcL2RcQBZrnk2++6hcdnbvAAqaO2AwfRBU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z97b3Wae+pHawT2UsteQ+at02TMSJ7cMlkalkbH788SUJB7hKTOBaPAlsO+dTwyTdf8jSonaF6gmQGgMC1Uvx1QoZdHWm13FtfwN8zRAsCwv8ZLmZ+cMiRmGJ+M+I4Tn2Q76N8BgLLnjPBnafHtHg/i5Q94+h+Q12/yvBWz8/E4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=stDTacwy; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="stDTacwy"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ae4b40999bso3295ad.1
        for <llvm@lists.linux.dev>; Wed, 04 Mar 2026 13:10:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772658618; cv=none;
        d=google.com; s=arc-20240605;
        b=eebB7HaZ6/wx61etV0RCcYfnFJLvyXothpKxxKowEplZS19JyfhZIw9nj0L/ekDTgk
         VVjmZ7dSTSVFTYm9fWra4D5P6FL4n+/nBR/FCoM6sVvPsBE5RtjKzQ99wOsPtVpUijYP
         n7eEFc9NmL62WoixEBMrl2rCLBjagsffi7iYfPrHBdwvrT3Di2HJdt8okGpWHoVX8tva
         753BIX6POS0bby56IFDyRRZLpkC5NTRMtxbttHXs6OEsrgk3+YekLbe4l3vNk6iSfuhP
         2AAYf0zImVjzAfabXElb71M4EvITrXEbpYi0KuM6pTx/799XYAOO6V+gDQTcFjojMZF2
         652A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1x0qGC1z7KcL2RcQBZrnk2++6hcdnbvAAqaO2AwfRBU=;
        fh=XZyvpg95KGE/tyms0IqOmM/wrGPX3pQMPAb0VRntKhM=;
        b=SA2NOkj2Jb8WuA4NKsxvphDdPLGeca2Gz6HvG9pUlr6P1cLZ+SGNuzZahAggm9J/IG
         Y/+qLSGfGMmCRR0TX7f/nweybKPHVjbXv1R+gKpxQNQUWLS1FlkmRucTOroeZ+xkDySg
         Un0v+ZtHBD2uXkPxCkIk7UycWfZPOW8FAQMeqKYvHqJUH9Vqx649EW6HYBAMilWEKW01
         WHeuUNQlEQUCflR6a1DWvsGXMe5hesUVh6DLSRRrtbzQhdnYvVnJ4oktUeFXU3DYsRg/
         Iw2RuOyzd5RWNzzn3L6CWSvRdVVF0bEJ9ZC8qo4ksgCff5l98L9Z8L9asQLugcieINY0
         /lUw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772658618; x=1773263418; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1x0qGC1z7KcL2RcQBZrnk2++6hcdnbvAAqaO2AwfRBU=;
        b=stDTacwyRM2h7y5oH3ZALUY120IuFWBGk1MEWRP/NDl9lvRDRg2RKcp3kHFy7wW5Ht
         e9XBTk9mXMVGPBTMdsPGoWzBfdcmxd5vamjFtoXfJewh3GbWrsvX/byaA6iTa5e1syRs
         vUd5NguzOABKkpjswm2MGy0y+FUu1jumxva70/ONpfWPvF7SnpDVxC+TcpUiezArGsxz
         weEMbjUpOZGDHx/NmdfM/vUSRuzYZIXUzaASc9T7H036h562+TM4JCVgISXD/R0n2aOT
         gKgsWBA9IH56vUISCRMN+vj7vRuQeo+pwWtm3DxPalfvbQuDH/zfJxTLYWNBiSaINKik
         g7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772658618; x=1773263418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1x0qGC1z7KcL2RcQBZrnk2++6hcdnbvAAqaO2AwfRBU=;
        b=xB2PVyGN+V65b3tpm9A2HAvmrS4lEerEeLYJL++uzNF/0tdI5vAmcPbe1LjYGjRI6/
         l5hB/RsQ7OuWAbdkfLFIZzWhekZEzoqRGNCnch/omGGgNstLn7eYhQzEvAWZv+M7ekmR
         huSUktnNgOPnMOV7jryc5pPde3E5E3XyYI+QSCBIUcJPZ8o4XM+zvq4BDkrv10UZ80ZG
         XOFTb+lT2ilMEDyliH7cC2RdKLJ1KwSr3B7EjmjaeNxvX3ePFRZt8WP7euh4QW1SmLeY
         903KyXAQd8pgN5oHmTduq9Gu1toYpDDeEXpPLO04pOeaLH5zikl+JAkmqGl1P+3wJoRS
         ZLpg==
X-Forwarded-Encrypted: i=1; AJvYcCUCrjX2fQW8w6HAQrllwxU/I3tFXmcsJD9C36w52ynQ4GADASC8O0aVTg7h9SO06hUkLsK0@lists.linux.dev
X-Gm-Message-State: AOJu0YwPfstsyZRti3jvx4sPSwhTNRx7UxZbswu8ULme4q5XGqUiyz7Q
	PfrsdTqHtJa6VTEz5tZgiBbwN9RyzmK9aU+l0BjcUOSWF+cLrvBmyrDZ57x1WgFZd7YTJDn/nBe
	EuFMCmq1BHDiYjpqAiDEa966C4AqEYSupvxCcUqEu
X-Gm-Gg: ATEYQzyNfJ52pGL7rN+5mW1JK+IMb1lLZJ/0y2ZQfVWmBTKlnhQ4BZ66wJeOmMeppLf
	dYVpaxJXXo4ehNZmoLsV5/sSmxzmTQB8T20R85OtEfAazu7gdtdbuKc4jS9et/Uo+BlZaHeFBYb
	koMR9355M+cxs2cl6c1VP72DnZ/1zMis92I0VjPkVxzJRib48uYUUe5QJ5VyeigrgENJbkEKECC
	WlVLA/tfrczt5w5p/23pCnf5lHnWyM3GhLSdIyQHMoClYiOBv1sK3tlyFMIAMMjtPiR8xKdZE7E
	E6NjyRv9VZPlcavyp+3SuLYIbdI2fB/8Gi95
X-Received: by 2002:a17:903:2291:b0:2a0:89b0:71d7 with SMTP id
 d9443c01a7336-2ae75200aa6mr154585ad.13.1772658617476; Wed, 04 Mar 2026
 13:10:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260303230043.2074593-1-pcc@google.com> <CAP-5=fWL0jKGQuqBzP0xMWVkzu48c6JzgwWQ1+NkAxgbpSPpcg@mail.gmail.com>
In-Reply-To: <CAP-5=fWL0jKGQuqBzP0xMWVkzu48c6JzgwWQ1+NkAxgbpSPpcg@mail.gmail.com>
From: Peter Collingbourne <pcc@google.com>
Date: Wed, 4 Mar 2026 13:10:02 -0800
X-Gm-Features: AaiRm51Ju52tciadDjfjY4seviPZ2A98iFg4I_8xpLY0b4aTjYIkv461rYRYz3k
Message-ID: <CAMn1gO6ojcmH-aciLT8XCMPMx8LaNSpUDzAWGjTUp1kGnwMd4w@mail.gmail.com>
Subject: Re: [PATCH] perf llvm: Clean up after a failed disassembly
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 3, 2026 at 3:29=E2=80=AFPM Ian Rogers <irogers@google.com> wrot=
e:
>
> On Tue, Mar 3, 2026 at 3:00=E2=80=AFPM Peter Collingbourne <pcc@google.co=
m> wrote:
> >
> > An error returned from a failed backend will cause perf to call the nex=
t
> > backend. If the error happens mid-function, e.g. due to an unrecognized
> > instruction, we will end up with duplicated instructions in the output
> > unless the backend that failed deletes any instructions that it created
> > before failing. The capstone backend was already doing this but the LLV=
M
> > backend was not; fix it.
> >
> > Link: https://linux-review.googlesource.com/id/I377eef3cd662ab98fbcd69e=
5004a259fa3d7aa06
> > Signed-off-by: Peter Collingbourne <pcc@google.com>
>
> Reviewed-by: Ian Rogers <irogers@google.com>

Thanks for the review. I guess this one should have also had

Fixes: 048856817888 ("perf annotate: LLVM-based disassembler")

Peter
